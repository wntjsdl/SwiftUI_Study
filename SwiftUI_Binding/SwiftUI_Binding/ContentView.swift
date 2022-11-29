//
//  ContentView.swift
//  SwiftUI_Binding
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// @Binding

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
            MyButton(str: $str)
            
        }
    }
}

struct MyButton: View {
    
    @Binding var str: String
    
    var body: some View {
        Button {
            self.str = "hi"
        } label: {
            Text("click me")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
