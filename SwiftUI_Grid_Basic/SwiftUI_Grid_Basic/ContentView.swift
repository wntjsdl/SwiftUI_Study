//
//  ContentView.swift
//  SwiftUI_Grid_Basic
//
//  Created by powerapp on 2022/11/17.
//

import SwiftUI

// Grid
// CollectionView
// 바둑판

struct ContentView: View {

    var columns: [GridItem] {
        [GridItem(.fixed(100))]
    }

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns) {
                Text("hi hello world")
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
