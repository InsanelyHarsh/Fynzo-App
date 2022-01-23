//
//  InputTextFieldView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 08/09/21.
//

import SwiftUI

struct EmailInputView: View {
    
    @Binding var text: String
    private let textFieldLeading:CGFloat = 30
    
    
    var body: some View {
        TextField("Email", text: $text)
            .frame(maxWidth: .infinity, minHeight: 44)
            //swift placeholder to left if no sf symbol is there
            .padding(.leading, textFieldLeading)
            .keyboardType(.emailAddress)
            .background(
                //adding sfsymbol & customising it!!
                ZStack(alignment: .leading){
                    
                        Image(systemName: "envelope")
                            .font(.system(size: 16 , weight : .semibold))
                            .padding(.leading , 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    // using rectangle to give rounded feel to textfield
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray.opacity(0.5))
                }
            )
    }
}

struct EmailInputView_previews: PreviewProvider {
    static var previews: some View {
//        InputTextFieldView()
        EmailInputView(text: .constant(""))
    }
}
