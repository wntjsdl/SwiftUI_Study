//
//  MyWebview.swift
//  SwiftUI_Image_tutorial
//
//  Created by JuSun Kang on 2022/03/27.
//

import SwiftUI
import WebKit

// UiKit의 UiView를 사용할 수 있도록 한다.
struct MyWebview: UIViewRepresentable {
    
    var urlToLoad: String
    
    // ui view  만들기
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        let webview = WKWebView()
        
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
    }
}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
