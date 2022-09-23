//
//  SwiftUI_Webview_tutorialApp.swift
//  SwiftUI_Webview_tutorial
//
//  Created by JuSun Kang on 2022/03/26.
//

import SwiftUI

@main
struct SwiftUI_Webview_tutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(WebViewModel())
        }
    }
}
