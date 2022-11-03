//
//  WebView.swift
//  SwiftUI_WebView
//
//  Created by powerapp on 2022/11/04.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {

    var url: String

    func makeUIView(context: Context) -> some UIView {
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)

        let wkWebView = WKWebView()
        wkWebView.load(request)

        return wkWebView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}

// UIViewConroller
struct MyWebVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {

        let webVC = UIStoryboard(name: "WebViewController", bundle: nil).instantiateViewController(identifier: "WebViewController") as! WebViewController

        let navi = UINavigationController(rootViewController: webVC)

        return navi
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

