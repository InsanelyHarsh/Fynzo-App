//
//  InputPassView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 08/09/21.
//

import SwiftUI

struct InputPassView: View {
    
    @Binding var password:String
    let placeholder:String
    let sfSymbol:String?
    private let textFieldLeading:CGFloat = 30
    
    var body: some View {
        //do not show what a user is typing
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.leading , sfSymbol == nil ? textFieldLeading/2: textFieldLeading)
            .background(
                ZStack(alignment: .leading){
                    if let systemImage = sfSymbol{
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading , 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 10 , style: .continuous)
                        .stroke(Color.gray.opacity(0.5))
                }
            )
    }
}

struct InputPassView_Previews: PreviewProvider {
    static var previews: some View {
//        InputPassView()
        InputPassView(password: .constant(""), placeholder: "Password", sfSymbol: "lock")
    }
}
