//
//  MyTextView.swift
//  SwiftUI_tutorial_#1
//
//  Created by JuSun Kang on 2022/03/23.
//

import SwiftUI

struct MyTextView: View {
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var index: Int = 0
    
    // 배경색 배열 준비
    private let backgroundColorsArray = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            Spacer()
            
        }
        .background(backgroundColorsArray[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경아이템이 클릭 되었다.")
            
            if(self.index == self.backgroundColorsArray.count - 1) {
                self.index = 0
            } else {
                self.index += 1
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
