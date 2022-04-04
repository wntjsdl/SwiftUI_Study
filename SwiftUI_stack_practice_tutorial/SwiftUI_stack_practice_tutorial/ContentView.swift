//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/03/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack {
                        
                        NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)){
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination:
                                        MyProfileView(isNavigationBarHidden: self.$isNavigationBarHidden)
                        ){
                            Image(systemName: "person.crop.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                    }.padding(20)
                    
                    Text("정대리 할 일 목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .padding(.horizontal, 20)
                    
                    ScrollView {
                        VStack {
                            
                            MyProjectCard()
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
                            MyCard(icon: "book.fill", title: "책 읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
                            MyBasicCard()
                            MyBasicCard()
                            MyBasicCard()
                            MyBasicCard()
                            MyBasicCard()
                            
                        }.padding()
                    }
                } // VStack
                
                Circle()
                    .foregroundColor(Color.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing, 10)
                    .shadow(radius: 20)
                
            } // ZStack
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear{
                self.isNavigationBarHidden = true
            }
        } // NavigationView
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
