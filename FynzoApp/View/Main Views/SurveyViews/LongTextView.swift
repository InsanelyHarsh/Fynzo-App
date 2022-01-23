//
//  LongTextView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI

struct LongTextView: View {
    @State var UserText:String = ""
    var body: some View {
            VStack{
                Text("Any Comment or Suggetions")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()

                ZStack{
                    
                    TextEditor(text: $UserText)
                     .font(.system(size: 27))
                     .background(
                        Rectangle()
                            .stroke(lineWidth: 5)
                     )
//                     .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).cornerRadius(10))
                     .foregroundColor(.black)
//                     .opacity(0.5)
                     .padding()
                     .frame(height: 300, alignment: .center)
                    
//                    Rectangle()
//                        .stroke(Color.blue, lineWidth: 12)
//                        .foregroundColor(.blue)
//                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
//                        .cornerRadius(8)
//                        .frame(height: 280, alignment: .center)
//                        .padding()
                }


            }
            .padding(.bottom,80)


    }
}

struct LongTextView_Previews: PreviewProvider {
    static var previews: some View {
        LongTextView()
    }
}
