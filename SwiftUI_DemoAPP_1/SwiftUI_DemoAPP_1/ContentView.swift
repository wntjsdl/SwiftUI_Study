//
//  ContentView.swift
//  SwiftUI_DemoAPP_1
//
//  Created by JuSun Kang on 2022/11/30.
//

import SwiftUI

struct GalleryItem: Hashable {
    var color: Color
    var title: String
}

struct ContentView: View {
    
    var items = [
        GalleryItem(color: .red, title: "title1tttttttttttttttttt"),
        GalleryItem(color: .blue, title: "title2"),
        GalleryItem(color: .gray, title: "title3"),
        GalleryItem(color: .green, title: "title4"),
        GalleryItem(color: .orange, title: "title5"),
        GalleryItem(color: .yellow, title: "title6"),
        GalleryItem(color: .pink, title: "title7")
    ]
    
    var itemSize = CGSize(width: 100, height: 100)
    var scrollViewSize = CGSize(width: 400, height: 300)
    
    var leadingPadding: CGFloat {
        scrollViewSize.width / 2 - itemSize.width / 2
    }
    
    var body: some View {
        
        GeometryReader{ scrollGeo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 50) {
                    ForEach(items, id: \.self) { item in
                        
                        GeometryReader { geometry in
                            ZStack {
                                Rectangle()
                                    .frame(width: itemSize.width, height: itemSize.height)
                                    .foregroundColor(item.color)
                                VStack {
                                    Spacer()
                                    Text(item.title)
                                        .padding(.bottom, 10)
                                }
                            }
                            .rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minX - leadingPadding) - Double(scrollGeo.frame(in: .global).minX)) / 3, axis: (x: 0, y: -1, z: 0))
                            
                            testFunc(geometry: geometry)
                        }
                        .frame(width: itemSize.width, height: itemSize.height)
                    }
                }
                .padding(.vertical, 50)
                .padding(.leading, leadingPadding)
                .padding(.trailing, leadingPadding)
                
            } // ScrollView
            .background(Color.black.opacity(0.2))
        }
        .frame(width: scrollViewSize.width, height: scrollViewSize.height)
    }
    
    func testFunc(geometry: GeometryProxy) -> some View {
        print(geometry.frame(in: .global).minX)
        return Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
