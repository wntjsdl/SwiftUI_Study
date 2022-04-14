//
//  MyCustomTabView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/15.
//

import SwiftUI

enum TabIndex {
    case home, cart, profile
}

struct MyCustomTabView: View {
    
    @State var tabIndex: TabIndex
    
    @State var largeScale: CGFloat = 1.4
    
    func changeMyView(tabIndex: TabIndex) -> MyView {
        switch tabIndex {
        case .home:
            return MyView(title: "홈", bgColor: .green)
        case .cart:
            return MyView(title: "장바구니", bgColor: .purple)
        case .profile:
            return MyView(title: "프로필", bgColor: .blue)
        default:
            return MyView(title: "홈", bgColor: .green)
        }
    }
    
    func changeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .home:
            return .green
        case .cart:
            return .purple
        case .profile:
            return .blue
        default:
            return .green
        }
    }
    
    func calcCircleBgPosition(tabIndex: TabIndex, geometry: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            return -(geometry.size.width / 3)
        case .cart:
            return 0
        case .profile:
            return geometry.size.width / 3
        default:
            return -(geometry.size.width / 3)
        }
    }
    
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack(alignment: .bottom){
                changeMyView(tabIndex: tabIndex)
                
                Circle()
                    .frame(width: 90, height: 90)
                    .offset(x: calcCircleBgPosition(tabIndex: tabIndex, geometry: geometry), y: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 0)
                    .foregroundColor(Color.white)
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button(action: {
                                print("홈 버튼 클릭")
                                withAnimation {
                                    tabIndex = .home
                                }
                            }) {
                                Image(systemName: "house.fill")
                                    .font(.system(size: 25))
                                    .scaleEffect(tabIndex == .home ? largeScale : 1.0)
                                    .foregroundColor(tabIndex == .home ? changeIconColor(tabIndex: tabIndex) : .gray)
                                    .frame(width: geometry.size.width / 3, height: 50)
                                    .offset(y: tabIndex == .home ? -10 : 0)
                        }.background(.white)
                        Button(action: {
                                print("장바구니 버튼 클릭")
                                withAnimation {
                                    tabIndex = .cart
                                }
                            }) {
                                Image(systemName: "cart.fill")
                                    .font(.system(size: 25))
                                    .scaleEffect(tabIndex == .cart ? largeScale : 1.0)
                                    .foregroundColor(tabIndex == .cart ? changeIconColor(tabIndex: tabIndex) : .gray)
                                    .frame(width: geometry.size.width / 3, height: 50)
                                    .offset(y: tabIndex == .cart ? -10 : 0)
                        }.background(.white)
                        Button(action: {
                                print("프로필 버튼 클릭")
                                withAnimation {
                                    tabIndex = .profile
                                }
                            }) {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 25))
                                    .scaleEffect(tabIndex == .profile ? largeScale : 1.0)
                                    .foregroundColor(tabIndex == .profile ? changeIconColor(tabIndex: tabIndex) : .gray)
                                    .frame(width: geometry.size.width / 3, height: 50)
                                    .offset(y: tabIndex == .profile ? -10 : 0)
                        }.background(.white)
                    }// HStack
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                }// VStack
            }
        }.edgesIgnoringSafeArea(.all)
        
        /*
        TabView{
            // 보여질 화면
//            Text("1번")
            MyView(title: "1번", bgColor: .red)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
//            Text("2번")
            MyView(title: "2번", bgColor: .orange)
                .tabItem {
                    Image(systemName: "cart.fill")
                }
                .tag(1)
            
//            Text("3번")
            MyView(title: "3번", bgColor: .brown)
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(2)
        }
        .background(.red)
        */
    }
}

struct MyCustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomTabView(tabIndex: .home)
    }
}
