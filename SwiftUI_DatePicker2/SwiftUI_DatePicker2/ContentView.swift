//
//  ContentView.swift
//  SwiftUI_DatePicker2
//
//  Created by JuSun Kang on 2022/11/29.
//

import SwiftUI

// Date Picker 2

struct ContentView: View {
    
    @State private var selectedDate = Date()
    
    var dateClosedRange: ClosedRange<Date> {
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        
        return startDate!...endDate!
    }
    
    var body: some View {
        
        DatePicker(selection: $selectedDate, in: dateClosedRange) {
            Text("selec Date")
        }
        .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
