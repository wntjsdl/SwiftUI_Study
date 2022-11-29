//
//  ContentView.swift
//  SwiftUI_NavigationView
//
//  Created by powerapp on 2022/11/17.
//

import SwiftUI

// NavigationView

struct ContentView: View {

    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]

        let myAppearance = UINavigationBarAppearance()

        myAppearance.titleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont.italicSystemFont(ofSize: 30)]

        myAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont.italicSystemFont(ofSize: 30)]

        myAppearance.backgroundColor = .orange

        UINavigationBar.appearance().standardAppearance = myAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = myAppearance
        UINavigationBar.appearance().compactAppearance = myAppearance

        UINavigationBar.appearance().tintColor = .yellow
    }

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Destination"), label: {
                    HStack {
                        Image(systemName: "person")
                        Text("Navigate")
                    }
                })
            }
            .navigationBarTitle("Hello", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
