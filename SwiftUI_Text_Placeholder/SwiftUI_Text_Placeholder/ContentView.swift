//
//  ContentView.swift
//  SwiftUI_Text_Placeholder
//
//  Created by powerapp on 2022/11/17.
//

import SwiftUI

// Placeholder
// redact

struct ContentView: View {

    @State private var myString = "hello world"

    @State private var showPlaceholder = false

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                Text(myString)
                    .padding()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())

            Button("click me") {
                showPlaceholder.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
