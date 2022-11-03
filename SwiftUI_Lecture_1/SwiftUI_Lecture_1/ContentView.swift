//
//  ContentView.swift
//  SwiftUI_Lecture_1
//
//  Created by powerapp on 2022/11/04.
//

import SwiftUI

// Stack
// H V Z

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Text("Hello, world!")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.top, 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
