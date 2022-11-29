//
//  ContentView.swift
//  SwiftUI_ObservableObject_ObservedObject
//
//  Created by JuSun Kang on 2022/11/29.
//


// ObservableObject - 감시, 관찰 가능한 객체
// ObservedObject - 관찰 된 객체
// 관찰 - 변경 삭제 추가 -> 상태변경을 계속 확인하는 것

// class에서 가능

import SwiftUI

class MyProfile: ObservableObject {
    @Published var name = "kim"
    @Published var age = 0
    
    func changeProfile() {
        self.age = 10
        self.name = "min"
    }
}

struct ContentView: View {
    
    @ObservedObject var profile = MyProfile()
    
    var body: some View {
        VStack {
            VStack {
                Text("age \(self.profile.age)")
                Text("name \(self.profile.name)")
            }
            
            Button {
                self.profile.changeProfile()
            } label: {
                Text("Click me")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
