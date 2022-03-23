//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by JuSun Kang on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    MyVStackView()
                    MyVStackView()
                    MyVStackView()
                }
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 제스쳐 추가
                .onTapGesture {
                    print("HStack 이 클릭되었다.")
                    
                    // 애니메이션과 함께
                    withAnimation {
                        self.isActivated.toggle()
                    }
                } // HStack
                
                // 네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView()) {
                    Text("네비게이션")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                } .padding(.top, 50)
            } // VStack
        } // NavigationView
        .accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
