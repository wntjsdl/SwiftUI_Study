//
//  MyWebview.swift
//  SwiftUI_Webview_tutorial
//
//  Created by JuSun Kang on 2022/03/26.
//

import SwiftUI
import WebKit
import Combine

// UiKit의 UiView를 사용할 수 있도록 한다.
struct MyWebview: UIViewRepresentable {

    @EnvironmentObject var viewModel: WebViewModel
    
    var urlToLoad: String

    // 코디네이터 만들기
    func makeCoordinator() -> MyWebview.Coordinator {
        return MyWebview.Coordinator(self)
    }
    
    // ui view  만들기
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }

        // 웹뷰 인스턴스 생성
        let webview = WKWebView(frame: .zero, configuration: createWKWebConfig())

        // wkWebView의 delegate 연결을 위한 코디네이터 설정
        webview.uiDelegate = context.coordinator as? WKUIDelegate
        webview.navigationDelegate = context.coordinator as? WKNavigationDelegate
        webview.allowsBackForwardNavigationGestures = true // 가로 스와이프 뒤로가기 설정

        // 웹뷰 로드
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {

    }

    func createWKWebConfig() -> WKWebViewConfiguration {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        preferences.javaScriptEnabled = true

        let wkWebConfig = WKWebViewConfiguration()

        // 웹뷰 유저 컨트롤러
        let userContentController = WKUserContentController()
        userContentController.add(self.makeCoordinator(), name: "callbackHandler")
        userContentController.add(self.makeCoordinator(), name: "powerapp_login")
        userContentController.add(self.makeCoordinator(), name: "powerapp_logout")
        userContentController.add(self.makeCoordinator(), name: "powerapp_check_usim")
        wkWebConfig.userContentController = userContentController
        wkWebConfig.preferences = preferences
        return wkWebConfig
    }

    class Coordinator: NSObject {

        var myWebView: MyWebview // SwiftUi View

        var subscriptions = Set<AnyCancellable>()

        init(_ myWebView: MyWebview) {
            self.myWebView = myWebView
        }
    }

}

// MARK: - WKUIDelegate 관련
extension MyWebview.Coordinator: WKUIDelegate {

    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        self.myWebView.viewModel.jsAlertEvent.send(JsAlert(message, .JS_ALERT))
        completionHandler()
    }

}

// MARK: - WKNavigationDelegate 관련
extension MyWebview.Coordinator: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        let navigationPolicy = WKNavigationResponsePolicy.allow
        decisionHandler(navigationPolicy)
    }

    // 웹뷰 검색 시작 시
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        // 로딩 중 알리기
        self.myWebView.viewModel.shouldShowIndicator.send(true)

        myWebView.viewModel.webNavigationSubject
            .sink { (action: WEB_NAVIGATION) in
                print("들어온 네비게이션 액션: \(action)")
                switch action {
                case .BACK:
                    if webView.canGoBack {
                        webView.goBack()
                    }
                case .FORWARD:
                    if webView.canGoForward {
                        webView.goForward()
                    }
                case .REFRESH:
                    webView.reload()
                }
            }.store(in: &subscriptions)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        // 로딩 중 알리기
        self.myWebView.viewModel.shouldShowIndicator.send(true)
    }

    // 웹뷰 검색 완료 시
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        webView.evaluateJavaScript("document.title") { (res, err) in
            if let err = err {
                print("타이틀 에러때문에 못가져옴 error: \(err)")
            }
            if let title = res as? String {
                self.myWebView.viewModel.webSiteTitleSubject.send(title)
            }
        }

        myWebView.viewModel.nativeToJsEvent
            .sink { message in
                print("didFinish() called / nativeToJsEvent 이벤트 들어옴 / message: \(message)")
                webView.evaluateJavaScript("nativeToJsEventCall('\(message)');") { result, err in
                    if let result = result {
                        print("nativeToJs result 성공: \(result)")
                    }
                    if let err = err {
                        print("nativeToJs result 실패: \(err.localizedDescription)")
                    }
                }
            }.store(in: &subscriptions)

        myWebView.viewModel.changedUrlSubject
            .compactMap{ $0.url }
            .sink { changedUrl in
                print("변경된 url: \(changedUrl)")
                webView.load(URLRequest(url: changedUrl))
            }.store(in: &subscriptions)

        // 로딩 끝 알리기
        self.myWebView.viewModel.shouldShowIndicator.send(false)
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        // 로딩 끝 알리기
        self.myWebView.viewModel.shouldShowIndicator.send(false)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        // 로딩 끝 알리기
        self.myWebView.viewModel.shouldShowIndicator.send(false)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |")

        // 로딩 끝 알리기
        self.myWebView.viewModel.shouldShowIndicator.send(false)
    }

}

// MARK: - WKScriptMessageHandler 관련
extension MyWebview.Coordinator: WKScriptMessageHandler {

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("| \(URL(fileURLWithPath: #file).lastPathComponent) | \(#line) | \(#function) |\nmessage:\(message)")

        if message.name == "callbackHandler" {
            print("JSON 데이터가 웹으로부터 옴: ", message.body)
            if let receivedData: [String: String] = message.body as? Dictionary {
                print("receivedData: ", receivedData)
                myWebView.viewModel.jsAlertEvent.send(JsAlert(receivedData["message"], .JS_BRIDGE))
            }
        }
        if message.name == "powerapp_login" {
            print("JSON 데이터가 웹으로부터 옴: ", message.body)
            if let receivedData: [String: String] = message.body as? Dictionary {
                print("receivedData: ", receivedData)
            }
        }
        if message.name == "powerapp_logout" {
            print("JSON 데이터가 웹으로부터 옴: ", message.body)
            if let receivedData: [String: String] = message.body as? Dictionary {
                print("receivedData: ", receivedData)
            }
        }
        if message.name == "powerapp_check_usim" {
            print("JSON 데이터가 웹으로부터 옴: ", message.body)
            if let receivedData: [String: String] = message.body as? Dictionary {
                print("receivedData: ", receivedData)
            }
        }

    }

}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.naver.com") 
    }
}
