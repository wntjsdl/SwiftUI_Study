//
//  ContentView.swift
//  SwiftUI_GeometryReader2
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// Geometry Reader

struct ContentView: View {
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height: proxy.size.height / 3)
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
