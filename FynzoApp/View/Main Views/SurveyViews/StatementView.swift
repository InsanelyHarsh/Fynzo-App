//
//  StatementView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI

struct StatementView: View {
    @State var Entry:String
    @State var EntryTitle:String
    var body: some View {
//        ZStack {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                
                Text(EntryTitle)
                    .font(.system(size: 20))
                
                Spacer()
            }
            
            
            
                TextField("your answer here", text: $Entry)
                    .foregroundColor(.black)
                    .frame(height: 45, alignment: .center)
                    .background(
                       Rectangle()
                           .stroke(lineWidth: 3)
                    )
//                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
//                    .padding()
                
        }
        .padding(.horizontal)
//        }
    }
}

struct StatementView_Previews: PreviewProvider {
    static var previews: some View {
        StatementView(Entry: "", EntryTitle: "Mobile Number")
    }
}
