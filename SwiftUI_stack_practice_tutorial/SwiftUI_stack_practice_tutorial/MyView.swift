//
//  MyView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/15.
//

import SwiftUI

struct MyView: View {
    
    var title: String
    var bgColor: Color
    
    var body: some View {
        ZStack{
            bgColor
//                .edgesIgnoringSafeArea(.top)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
        }.animation(.none)
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "마이뷰", bgColor: .orange)
    }
}
