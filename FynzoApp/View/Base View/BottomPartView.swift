//
//  BottomPartView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

struct BottomPartView: View {
//    let width = UIScreen.main.bounds.width
//    @Namespace var namespace
    var body: some View {
        
//        VStack(spacing:20){
//            HStack {
//                Spacer()
//
//            }
//            .padding(.trailing,30)
            
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 60, alignment: .center)
                        .foregroundColor(Color.blue)
//                        .foregroundColor(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)))
                    
                    HStack {
                        Image("iconfinder_update_172618")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
//                        Image(systemName: "arrow.clockwise.circle")
                        
                        VStack {
                            Text("Update Forms")
                            Text("Last Updated")
                        }
                    }
                    .foregroundColor(Color.white)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 60, alignment: .center)
                        .foregroundColor(Color.gray)
//                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.85)))
                    
                    HStack {
                        Image("iconfinder_upload2_172620")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
//                        Image(systemName: "icloud.and.arrow.up")
                        VStack {
                            Text("Upload Local Data")
                            Text("Stored loacally")
                        }
                    }
                    .foregroundColor(Color.white)
                }
            }
            .foregroundColor(.black)
//        }
        
    }
}

struct BottomPartView_Previews: PreviewProvider {
    static var previews: some View {
        BottomPartView()
    }
}
