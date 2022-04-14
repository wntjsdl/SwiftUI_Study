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
    
    // 지오메트리 프록시를 매개변수로 가지고 CGPoint 를 반환하는 클로저
    let centerPosition: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        
        GeometryReader{ proxy in
            VStack(spacing: 0) {
                
                Button(action: {
                    withAnimation {
                        index = .one
                    }
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: proxy.size.height / 3)
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
                        .frame(width: 100, height: proxy.size.height / 3)
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
                        .frame(width: 100, height: proxy.size.height / 3)
                        .padding(.horizontal, index == .three ? 60 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                }
                
            }
//                .position(CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY))
                .position(centerPosition(proxy))
                .edgesIgnoringSafeArea(.all)
                .frame(width: proxy.size.width)
                .background(Color.yellow)
        }
    }
}

struct MyGeometryReaderVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReaderVStack()
    }
}
