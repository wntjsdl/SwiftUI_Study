//
//  ContentView.swift
//  SwiftUI_View_Modifier
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI
// Button reusable (Button Style)

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print("selected")
            } label: {
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.largeTitle)
                    Text("Edit")
                        .font(.largeTitle)
                }
            }
            .buttonStyle(MyCustomButton())
            
            Button {
                print("btn 2")
            } label: {
                Text("hi")
            }
            .buttonStyle(MyCustomButton())
        }
    }
}

struct MyCustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(20)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
