//
//  StateMentQuestionView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI

struct StateMentQuestionView: View {
    @State var ShortTextTitle:String = ""
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Can We know more About You?")
                    .fontWeight(.medium)
                    .font(.system(size: 30))
                
                Spacer()
            }
            
            StatementView(Entry: "", EntryTitle: "Name")
            StatementView(Entry: "", EntryTitle: "Mobile")
            StatementView(Entry: "", EntryTitle: "Email")
            Spacer()
        }
    }
}

struct StateMentQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        StateMentQuestionView()
    }
}
