//
//  UserDetailsView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 08/09/21.
//

import SwiftUI

struct UserDetailsView: View {
    @Binding var text: String
    let placeholder:String
    let keyboardType:UIKeyboardType
//    let sfSymbol:String?
    private let textFieldLeading:CGFloat = 30
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.leading, textFieldLeading/2)
            .keyboardType(keyboardType)
            .background(
                ZStack(alignment: .leading){
                    

                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.blue.opacity(0.5))
                }
            )    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(text: .constant(""), placeholder: "Name", keyboardType: .default)
    }
}
