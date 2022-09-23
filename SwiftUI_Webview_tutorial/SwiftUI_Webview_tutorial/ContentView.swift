//
//  ContentView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by JuSun Kang on 2022/03/26.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var webVM: WebViewModel

    @State private var jsAlert: JsAlert?
    @State private var textString = ""
    @State private var shouldShowAlert = false
    @State private var isLoading = false
    @State private var webTitle: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    MyWebview(urlToLoad: "https://tuentuenna.github.io/simple_js_alert/")
                    webViewBottomTabbar
                }
                .navigationBarTitle(Text(webTitle), displayMode: .inline)
                .navigationBarItems(
                    leading: siteMenu,
                    trailing: Button("iOS -> Js"){
                        print("iOS -> Js 버튼 클릭")
                        self.shouldShowAlert.toggle()
                    }
                )
                .alert(item: $jsAlert) { alert in
                    createAlert(alert)
                }
                if self.shouldShowAlert{ createTextAlert() }
                if self.isLoading{ LoadingScreenView() }
//                Text(textString)
//                    .font(.system(size: 26))
//                    .foregroundColor(Color.yellow)
//                    .offset(y: -(UIScreen.main.bounds.height * 0.3))
            }// ZStack
            .onReceive(webVM.webSiteTitleSubject) { receivedWebTitle in
                print("ContentView - webTitle: ", receivedWebTitle)
                self.webTitle = receivedWebTitle
            }
            .onReceive(webVM.jsAlertEvent) { jsAlert in
                print("ContentView - jsAlert: ", jsAlert)
                self.jsAlert = jsAlert
            }
            .onReceive(webVM.shouldShowIndicator) { isLoading in
                print("ContentView - isLoading: ", isLoading)
                self.isLoading = isLoading
            }
        }// NavigationView
    }// body

    // 사이트 메뉴
    var siteMenu: some View {
        Text("사이트 이동")
            .foregroundColor(.blue)
            .contextMenu(ContextMenu(menuItems: {
                Button {
                    print("테스트페이지 이동")
                    self.webVM.changedUrlSubject.send(.TESTHTML)
                } label: {
                    Text("테스트페이지 이동")
                }
                Button {
                    print("cocenstore 이동")
                    self.webVM.changedUrlSubject.send(.COCENSTORE)
                } label: {
                    Text("cocenstore 이동")
                    Image("cocenstore")
                }
                Button {
                    print("네이버로 이동")
                    self.webVM.changedUrlSubject.send(.NAVER)
                } label: {
                    Text("네이버로 이동")
                    Image("naver")
                }
                Button {
                    print("구글로 이동")
                    self.webVM.changedUrlSubject.send(.GOOGLE)
                } label: {
                    Text("구글 이동")
                    Image("google")
                }
            }))
    }

    var webViewBottomTabbar: some View {
        VStack {
            Divider()
            HStack {
                Spacer()
                Button {
                    print("뒤로가기")
                    self.webVM.webNavigationSubject.send(.BACK)
                } label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20))
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button {
                    print("앞으로가기")
                    self.webVM.webNavigationSubject.send(.FORWARD)
                } label: {
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 20))
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button {
                    print("새로고침")
                    self.webVM.webNavigationSubject.send(.REFRESH)
                } label: {
                    Image(systemName: "goforward")
                        .font(.system(size: 20))
                }
                Spacer()
            }.frame(height: 45)
            Divider()
        }
    }
}

extension ContentView {

    func createAlert(_ alert: JsAlert) -> Alert {
        Alert(title: Text(alert.type.description), message: Text(alert.message), dismissButton: .default(Text("확인"), action: {
            print("알림창 확인 버튼이 클릭 됨.")
        }))
    }

    // 텍스트 입력 얼럿창
    func createTextAlert() -> MyTextAlertView {
        MyTextAlertView(textString: $textString, showAlert: $shouldShowAlert, title: "iOS -> Js 보내기", message: "")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
