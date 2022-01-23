//
//  AddButtonView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

/*
 BottomPartView()
     .padding(.horizontal)
     .padding(.vertical,5)
     .padding(.bottom)
 */

struct AddButtonView: View {
    @State var ispressed:Bool = true
    @Namespace var namespace
    var body: some View {
        ZStack{
            VStack(spacing:70){
                if ispressed{
                    Image(systemName: "arrow.up.doc.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.black)
                        
                }
                
                
                Button(action: {
                    withAnimation {
                        ispressed.toggle()
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: ispressed ? 45:0))
                        

                })
            }
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
