//
//  ContentView.swift
//  SwiftUI_Modifier
//
//  Created by JuSun Kang on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Main Title!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
            Text("Sub Title!")
                .modifier(MyTextStyle())
            Text("Description!")
                .modifier(MyTextStyle(myColor: .red))
            Text("Hello, world!")
                .modifier(MyTextStyle(myWeight: .bold))
            Text("Description!")
                .customFont(color: .orange)
        }
        .padding()
    }
}

struct MyTextStyle: ViewModifier {
    
    var myWeight = Font.Weight.regular
    var myFont = Font.title2
    var myColor = Color.black
    
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            .padding(.bottom, 20)
    }
}

extension Text {
    func customFont(color: Color) -> Text {
        self
            .font(.title2)
            .bold()
            .italic()
            .foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
