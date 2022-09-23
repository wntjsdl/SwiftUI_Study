//
//  LoadingIndicatorView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by powerapp on 2022/09/23.
//

import Foundation
import UIKit
import SwiftUI

struct LoadingIndicatorView: UIViewRepresentable {

    var isAnimating: Bool = true
    var color: UIColor = .white

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        uiView.style = .large
        uiView.color = color
    }

}
