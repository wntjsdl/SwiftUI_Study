//
//  MyTabView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/15.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView{
            // 보여질 화면
//            Text("1번")
            MyView(title: "1번", bgColor: .red)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            
//            Text("2번")
            MyView(title: "2번", bgColor: .orange)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            
//            Text("3번")
            MyView(title: "3번", bgColor: .brown)
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
        .background(.red)
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
