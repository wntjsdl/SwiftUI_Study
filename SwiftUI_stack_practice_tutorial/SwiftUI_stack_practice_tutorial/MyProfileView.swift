//
//  MyProfileView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/05.
//

import SwiftUI

struct MyProfileView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        VStack {
            Image("1")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(lineWidth: 10)
                        .foregroundColor(Color.red)
                )
            Text("개발하는 주선이")
                .font(.largeTitle)
                .padding(10)
            Text("열공하자!!")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(10)
            HStack {
                Button(action: {
                    
                }) {
                    Text("Google")
                        .foregroundColor(.white)
                        .padding()
                        .font(.system(size: 20))
                        .frame(width: 100)
                        .background(Color.red)
                        .cornerRadius(20)
                }
                Button(action: {
                    
                }) {
                    Text("Naver")
                        .foregroundColor(.white)
                        .padding()
                        .font(.system(size: 20))
                        .frame(width: 100)
                        .background(Color.green)
                        .cornerRadius(20)
                }
            } // HStack
            
            Spacer()
        } // VStack
        .navigationTitle("내 프로필")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination:
                    Text("설정 화면 입니다.")
                ){
                    Image(systemName: "gearshape")
                        .font(.system(size: 25))
                        .foregroundColor(Color.black)
                }
            }
        }
        .onAppear{
            self.isNavigationBarHidden = false
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
