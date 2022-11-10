//
//  ContentView.swift
//  SwiftUI_Lecture8_List
//
//  Created by powerapp on 2022/11/11.
//

import SwiftUI

// List
// Model

// Model
struct LocationInfo: Hashable, Identifiable {
    var id = UUID()
    var city = ""
    var weather = ""
}

struct ContentView: View {

    @State private var locations = [
        LocationInfo(city: "seoul", weather: "sunny"),
        LocationInfo(city: "seoul", weather: "sunny"),
        LocationInfo(city: "busan", weather: "cloudy"),
        LocationInfo(city: "la", weather: "rainy")
    ]

    var body: some View {
        List {
            // Hashable
            ForEach(locations, id: \.self) { location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }

            // Identifiable
            ForEach(locations) { location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }

            ForEach(0..<locations.count) { index in
                HStack {
                    Text("\(index + 1)")
                    Text("\(locations[index].city)")
                    Text("\(locations[index].weather)")
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
