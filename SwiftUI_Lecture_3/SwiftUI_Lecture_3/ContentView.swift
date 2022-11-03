//
//  ContentView.swift
//  SwiftUI_Lecture_3
//
//  Created by powerapp on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
//            .aspectRatio(contentMode: .fit)
            .mask(Circle())
            .frame(width: 300, height: 300)
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
