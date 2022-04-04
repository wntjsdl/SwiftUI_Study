//
//  MyList.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by JuSun Kang on 2022/04/01.
//

import SwiftUI

struct MyList: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        if #available(iOS 14.0, *){
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
        
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        
//        List{
//            Text("마이리스트!")
//            Text("마이리스트!")
//            Text("마이리스트!")
//            Text("마이리스트!")
//            Text("마이리스트!")
//        }
        
//        List{
//            ForEach(1...10, id: \.self){
//                Text("마이리스트\($0)")
//            }
//        }
        
        List{
            
            Section(
                header: Text("오늘 할 일.")
                    .font(.headline)
                    .foregroundColor(Color.black)
                , footer: Text("footer")){
                    ForEach(1...3, id: \.self){ itemIndex in
                        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
                    }
                }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(
                header: Text("내일 할 일.")
                    .font(.headline)
                    .foregroundColor(Color.black)){
                    ForEach(1...20, id: \.self){ itemIndex in
        //                Text("마이리스트 \(itemIndex)")
                        MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.blue).hideRowSeparator(insets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), background: Color.yellow)
                    }
                }
//            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
//            .listRowBackground(Color.yellow)
            
        }
        .listStyle(GroupedListStyle())
//        .navigationTitle("내 목록")
//        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear{
            self.isNavigationBarHidden = false
        }
    } // NavigationView
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}

struct HideRowSeparatorModifier: ViewModifier {
    static let defaultListRowHeight: CGFloat = 44
    
    var insets: EdgeInsets
    var background: Color
    init(insets: EdgeInsets, background: Color){
        self.insets = insets
        
        var alpha: CGFloat = 0
        
        UIColor(background).getWhite(nil, alpha: &alpha)
        assert(alpha == 1, "")
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0, maxWidth: .infinity, minHeight: Self.defaultListRowHeight,   alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}
extension EdgeInsets{
    static let defaultListRowInsets = Self(top: 10, leading: 10, bottom: 10, trailing: 10)
}
extension View {
    func hideRowSeparator(insets: EdgeInsets = .defaultListRowInsets, background: Color = .white)
    -> some View {
        modifier(HideRowSeparatorModifier(insets: insets, background: background))
    }
}
