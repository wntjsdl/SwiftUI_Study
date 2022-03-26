//
//  ContentView.swift
//  SwiftUI_text_tutorial
//
//  Created by JuSun Kang on 2022/03/26.
//

import SwiftUI

struct ContentView: View {
    
    static let dateformat: DateFormatter = {
       let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY년 M월 d일"
        formatter.dateStyle = .long
        return formatter
    }()
    
    var today = Date()
    
    var trueOrFalse: Bool = false
    
    var number: Int = 123
    
    var body: some View {
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .tracking(2)
            
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .lineSpacing(10)
                .truncationMode(.middle)
            
                .shadow(color: Color.red, radius: 1.5, x: -10, y: 10)
            
                .padding(.all, 20)
                .background(Color.yellow)
                .cornerRadius(10)
            
                .padding()
                .background(Color.green)
                .cornerRadius(20)
            
                .padding()
            
            Text("안녕하세요!!")
                .background(.gray)
                .foregroundColor(Color.white)
            
            Text("오늘의 날짜입니다: \(today, formatter: ContentView.dateformat)")
            
            Text("참 혹은 거짓: \(String(trueOrFalse))")
            
            Text("숫자 입니다: \(number)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
