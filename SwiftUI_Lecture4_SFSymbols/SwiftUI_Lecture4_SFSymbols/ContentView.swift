//
//  ContentView.swift
//  SwiftUI_Lecture4_SFSymbols
//
//  Created by powerapp on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "wifi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
