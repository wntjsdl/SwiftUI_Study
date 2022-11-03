//
//  ContentView.swift
//  SwiftUI_Lecture_2
//
//  Created by powerapp on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world! Hello, world! Hello, world! Hello, world! Hello, world! Hello, world!")
                .font(.largeTitle)
                .underline()
                .bold()
                .foregroundColor(.blue)
                .truncationMode(.tail)
                .lineSpacing(20)
                .background(Color.green)

            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
