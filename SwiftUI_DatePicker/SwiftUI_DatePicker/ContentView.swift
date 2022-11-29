//
//  ContentView.swift
//  SwiftUI_DatePicker
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// Date Picker

struct ContentView: View {
    
    @State private var selectedDate = Date()
    
    var presentDateStyle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm:ss"
        return formatter.string(from: selectedDate)
    }
    
    var body: some View {
        
        VStack {
            DatePicker(selection: $selectedDate, displayedComponents: .date) {
                Text("Selected Date")
            }
            .labelsHidden()
            
            Text(presentDateStyle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
