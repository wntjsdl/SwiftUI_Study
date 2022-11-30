//
//  ContentView.swift
//  SwiftUI_Aligment
//
//  Created by JuSun Kang on 2022/11/30.
//

import SwiftUI

// Aligment

struct ContentView: View {
    
    @State private var width: CGFloat = 80
    @State private var height: CGFloat = 80
    
    var body: some View {
        VStack(alignment: .myAlignment) {
            HStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: width, height: height)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: width, height: height)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: width, height: height)
                    .alignmentGuide(.myAlignment) { vDms in vDms[.leading] }
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: width, height: height)
            }
            
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: width, height: 20)
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: width, height: 20)
                .alignmentGuide(.myAlignment) { (vDms) -> CGFloat in
                    vDms[.trailing]
                }
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: width, height: 20)
        }
    }
}

extension HorizontalAlignment {
    
    struct MyAlign: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.leading]
        }
    }
    
    static let myAlignment = HorizontalAlignment(MyAlign.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
