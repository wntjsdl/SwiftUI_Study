//
//  ContentView.swift
//  SwiftUI_GeometryReader
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// Geometry Reader
// container view

struct ContentView: View {
    var body: some View {
        
        HStack {
            Text("Hello, World!")
                .frame(width: 100)
            
            GeometryReader { proxy in
                VStack {
                    Text("Hello, World!")
                        .frame(width: proxy.size.width)
                    Text("\(proxy.size.width)")
                    Text("\(proxy.frame(in: .global).minX)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
