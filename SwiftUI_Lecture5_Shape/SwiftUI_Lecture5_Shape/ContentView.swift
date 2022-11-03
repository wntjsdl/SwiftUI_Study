//
//  ContentView.swift
//  SwiftUI_Lecture5_Shape
//
//  Created by powerapp on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .miter, miterLimit: 1, dash: [20, 20], dashPhase: 10))
                .frame(width: 200, height: 100)

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 100, height: 100)

            Circle()
                .fill(Color.blue)
                .frame(width: 200, height: 100)

            Capsule()
                .fill(Color.blue)
                .frame(width: 200, height: 100)

            Ellipse()
                .fill(Color.blue)
                .frame(width: 200, height: 100)
        }
        .frame(width: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
