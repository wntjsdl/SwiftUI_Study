//
//  MyVStackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by JuSun Kang on 2022/03/23.
//

import SwiftUI

struct MyVStackView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // 생성자
    init(isActivated: Binding<Bool> = .constant(true)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
            .font(.largeTitle)
            Text("2!")
                .fontWeight(.bold)
            .font(.largeTitle)
            Text("3!")
                .fontWeight(.bold)
            .font(.largeTitle)
        } // VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}


struct MyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
