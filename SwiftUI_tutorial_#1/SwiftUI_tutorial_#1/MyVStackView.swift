//
//  MyVStackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by JuSun Kang on 2022/03/23.
//

import SwiftUI

struct MyVStackView: View {
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
            .font(.largeTitle)
            Text("2!")
                .fontWeight(.bold)
            .font(.largeTitle)
            Text("3!")
                .fontWeight(.bold)
            .font(.largeTitle)
        } // VStack
        .background(Color.red)
    }
}
