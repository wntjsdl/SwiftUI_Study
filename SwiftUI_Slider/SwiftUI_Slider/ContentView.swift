//
//  ContentView.swift
//  SwiftUI_Slider
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// Slider

struct ContentView: View {
    
    @State private var progressValue: Float = 0
    
    var sliderRange: ClosedRange<Float> {
        return 0...100
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "minus")
                    .onTapGesture {
                        self.progressValue -= 1
                    }
                
                Slider(value: $progressValue, in: sliderRange)
                    .accentColor(.red)
                
                Image(systemName: "plus")
                    .onTapGesture {
                        self.progressValue += 1
                    }
            }
            .padding(30)
            
            Text("\(Int(progressValue))")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
