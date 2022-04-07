//
//  MyGeometryReaderVStack.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/07.
//

import SwiftUI

enum Index {
    case one, two, three
}

struct MyGeometryReaderVStack: View {
    
    @State var index: Index = .one
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack(spacing: 0) {
                
                Button(action: {
                    withAnimation {
                        index = .one
                    }
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .one ? 60 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                }
                
                Button(action: {
                    withAnimation {
                        index = .two
                    }
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .two ? 60 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
                
                Button(action: {
                    withAnimation {
                        index = .three
                    }
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .three ? 60 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                }
                
            }
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width)
                .background(Color.yellow)
        }
    }
}

struct MyGeometryReaderVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReaderVStack()
    }
}
