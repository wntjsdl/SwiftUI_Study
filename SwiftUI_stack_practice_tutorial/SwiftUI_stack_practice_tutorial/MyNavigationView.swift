//
//  MyNavigationView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/04.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
//            Text("MyNavigationView")
            
            MyList()
            
                .navigationTitle("안녕하세요!")
//                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("호호")
                        }){
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 25))
                                .foregroundColor(Color.black)
                        }
                    }
                }
            
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
