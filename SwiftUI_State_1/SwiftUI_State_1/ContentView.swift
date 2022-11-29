//
//  ContentView.swift
//  SwiftUI_State_1
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// @State
// property wrapper

struct ContentView: View {
    
    @State private var str = "hello"
    
    var body: some View {
        VStack {
            
            TextField("placeholder TF", text: $str)
                .padding(20)
                .background(Color.black.opacity(0.2))
                .font(.largeTitle)
                .padding(20)
            
            Text(str)
                .font(.largeTitle)
            
            Button {
                self.str = "hi"
            } label: {
                Text("click me")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
