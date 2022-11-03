//
//  WebViewController.swift
//  SwiftUI_WebView
//
//  Created by powerapp on 2022/11/04.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!

    var url = "https://google.com"

    override func viewDidLoad() {
        self.webView.navigationDelegate = self
        self.webView.uiDelegate = self

        self.webView.load(URLRequest(url: URL(string: url)!))
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView.evaluateJavaScript("document.title") { (result, error) in
            self.navigationItem.title = result as? String
        }
    }

}
