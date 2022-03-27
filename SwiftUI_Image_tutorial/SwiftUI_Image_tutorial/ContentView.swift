//
//  ContentView.swift
//  SwiftUI_Image_tutorial
//
//  Created by JuSun Kang on 2022/03/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("myimage")
                    .frame(height: 10)
                    .offset(y: -1900)
                
                CircleImageView()
                
                HStack {
                    NavigationLink(destination: MyWebview(urlToLoad: "https://www.youtube.com")
                        .edgesIgnoringSafeArea(.all)
                    ) {
                        Text("유튜브 좀 그만봐")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebview(urlToLoad: "https://www.naver.com")
                        .edgesIgnoringSafeArea(.all)
                    ) {
                        Text("네이버 검색")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(20)
                    }
                } // HStack
                .padding(50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
