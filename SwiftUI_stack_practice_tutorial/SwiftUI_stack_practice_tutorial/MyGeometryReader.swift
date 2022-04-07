//
//  MyGeometryReader.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/07.
//

import SwiftUI

struct MyGeometryReader: View {
    var body: some View {
        
        GeometryReader{ geometry in
            
            HStack(spacing: 0) {
                Text("1")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometry.size.width / 3)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                Text("2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometry.size.width / 3)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                Text("3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geometry.size.width / 3)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                Text("4")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: 100)
                    .foregroundColor(Color.white)
                    .background(Color.purple)
            }.background(Color.yellow)
                
            
        }
        
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
