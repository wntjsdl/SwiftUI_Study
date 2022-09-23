//
//  LoadingScreenView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by powerapp on 2022/09/23.
//

import Foundation
import SwiftUI

struct LoadingScreenView: View {

    var body: some View {
        ZStack(alignment: .center) {
            Color.black
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            LoadingIndicatorView()
        }
    }
}
