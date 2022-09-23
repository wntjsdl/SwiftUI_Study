//
//  MyTextAlertView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by powerapp on 2022/09/23.
//

import Foundation
import UIKit
import SwiftUI

struct MyTextAlertView: UIViewControllerRepresentable {

    @EnvironmentObject var webVM: WebViewModel
    @Binding var textString: String
    @Binding var showAlert: Bool

    var title: String
    var message: String

    // 처음
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyTextAlertView>) -> some UIViewController {
        return UIViewController()
    }

    // 값이 변경 될 때
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<MyTextAlertView>) {

        // uiAlertController 가 없을 때만 띄우겠다.
        guard context.coordinator.uiAlertController == nil else { return }

        // showAlert 이 true라면
        if self.showAlert {
            // uiAlertController 띄우기
            let uiAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            uiAlertController.addTextField { textField in
                textField.placeholder = "전달 할 값을 입력하세요."
                textField.text = self.textString
            }

            uiAlertController.addAction(UIAlertAction(title: "취소", style: .destructive, handler: { _ in
                print("취소가 클릭되었다.")
                self.textString = ""
            }))

            uiAlertController.addAction(UIAlertAction(title: "보내기", style: .default, handler: { _ in
                print("취소가 클릭되었다.")
                if let textField = uiAlertController.textFields?.first,
                   let inputText = textField.text {
                    self.textString = inputText
                }

                uiAlertController.dismiss(animated: true) {
                    print("보내기 버튼 클릭")
                    self.webVM.nativeToJsEvent.send(textString)
                    self.textString = ""
                    self.showAlert = false
                }
            }))

            DispatchQueue.main.async {
                uiViewController.present(uiAlertController, animated: true) {
                    self.showAlert = false
                    context.coordinator.uiAlertController = nil
                }
            }
        }

    }

    func makeCoordinator() -> MyTextAlertView.Coordinator {
        MyTextAlertView.Coordinator(self)
    }

    // 중간의 매개체 UIKit 의 델리겟 등의 이벤트를 받아주는 역할
    class Coordinator: NSObject {
        var uiAlertController: UIAlertController? // UIKit 뷰
        var myTextAlertView: MyTextAlertView // SwiftUi 뷰

        init(_ myTextAlertView: MyTextAlertView) {
            self.myTextAlertView = myTextAlertView
        }
    }
}

extension MyTextAlertView.Coordinator: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            self.myTextAlertView.textString = text.replacingCharacters(in: range, with: string)
        } else {
            self.myTextAlertView.textString = ""
        }
        return false
    }
}
