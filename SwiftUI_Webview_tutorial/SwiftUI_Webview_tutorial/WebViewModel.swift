//
//  WebViewModel.swift
//  SwiftUI_Webview_tutorial
//
//  Created by powerapp on 2022/09/23.
//

import Foundation
import Combine

typealias WEB_NAVIGATION = WebViewModel.NAVIGATION

class WebViewModel: ObservableObject {
    enum NAVIGATION {
        case BACK, FORWARD, REFRESH
    }

    enum URL_TYPE {
        case NAVER
        case GOOGLE
        case TESTHTML
        case COCENSTORE
        var url: URL? {
            switch self {
            case .NAVER:
                return URL(string: "https://www.naver.com")
            case .GOOGLE:
                return URL(string: "https://www.google.com")
            case .TESTHTML:
                return URL(string: "https://tuentuenna.github.io/simple_js_alert/")
            case .COCENSTORE:
                return URL(string: "https://www.cocenstore.com/m")
            }
        }
    }

    // 웹뷰의 url 이 변경되었을 때 이벤트
    var changedUrlSubject = PassthroughSubject<WebViewModel.URL_TYPE, Never>()

    // 웹뷰 네비게이션 액션에 대한 이벤트
    var webNavigationSubject = PassthroughSubject<WEB_NAVIGATION, Never>()

    // 웹사이트 타이틀 이벤트
    var webSiteTitleSubject = PassthroughSubject<String, Never>()

    // iOS -> JS 함수 호출
    var nativeToJsEvent = PassthroughSubject<String, Never>()

    // 자바스크립트 alert이 들어오면 이벤트 보내기
    var jsAlertEvent = PassthroughSubject<JsAlert, Never>()

    // 로딩 여부 이벤트
    var shouldShowIndicator = PassthroughSubject<Bool, Never>()
}
