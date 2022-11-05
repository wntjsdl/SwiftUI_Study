//
//  ContentView.swift
//  SwiftUI_Lecture6_Button
//
//  Created by powerapp on 2022/11/05.
//

import SwiftUI

// Button
// State (Property wrapper)
// 하나의 뷰 안에서 사용되는 값

struct ContentView: View {

    @State private var didSelected = false

    var buttonImage: String {
        if didSelected {
            return "circle"
        } else {
            return "pencil"
        }
    }

    var body: some View {
        VStack {

            Text("current Status: \(didSelected.description)")

            Button {
                didSelected.toggle()
            } label: {
                HStack {
                    Image(systemName: buttonImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text("Button \(didSelected.description)")
                        Text("Button \(didSelected.description)")
                    }
                }
            } // Button
            .frame(width: 200, height: 200)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
