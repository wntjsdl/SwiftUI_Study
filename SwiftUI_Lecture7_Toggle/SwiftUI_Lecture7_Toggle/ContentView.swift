//
//  ContentView.swift
//  SwiftUI_Lecture7_Toggle
//
//  Created by powerapp on 2022/11/11.
//

import SwiftUI

struct ContentView: View {

    @State private var isOn = false

    var body: some View {

        VStack {
            MyToggle(isOn: $isOn)
            Text("\(isOn.description)")
        }

    }
}

struct MyToggle: View {

    @Binding var isOn: Bool

    var body: some View {
        Toggle("toggle \(isOn.description)", isOn: $isOn)
        Toggle(isOn: $isOn) {
            HStack {
                Spacer()
                VStack {
                    Text("Label")
                    Text("Label")
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
