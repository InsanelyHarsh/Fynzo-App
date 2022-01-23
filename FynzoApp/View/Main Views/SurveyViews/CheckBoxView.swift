//
//  CheckBoxView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI

struct CheckBoxView: View {
    @State var IsSeclected:Bool
    var body: some View {
        
        VStack{
            Image(systemName: IsSeclected ? "checkmark.square.fill":"checkmark.square")
                .resizable()
                .frame(width: 42, height: 42, alignment: .center)
                .foregroundColor(IsSeclected ? Color(red: 130/255, green: 36/255, blue: 50/255) : Color.black)
                .onTapGesture {
                    withAnimation {
                        IsSeclected.toggle()
                    }
            }
        }
//        .padding(.bottom,80)
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(IsSeclected: true)
//            .preferredColorScheme(.dark)
    }
}
