//
//  ContactUsView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 07/09/21.
//

import SwiftUI

struct ContactUsView: View {
    @State var FeedBackString :String = "Write your Feedback or Concern here...."
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
//        ZStack{
//            Image("background9")
//                .resizable()
//                .ignoresSafeArea()
//                .blur(radius: 100)
            VStack(alignment: .leading, spacing: 20, content: {
                Spacer()

                TextEditor(text: $FeedBackString)
                 .font(.system(size: 20))
                 .padding(.horizontal)
                 .background(
                    Rectangle()
                        .stroke(lineWidth: 2)
                 )
                 .frame(height: 200, alignment: .center)
                
                
//                TextEditor(text: $FeedBackString)
//                    .font(.system(size: 20))
//                    .padding(.horizontal)
//                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5103735513)).cornerRadius(10))
//                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
//                    .frame(height: 200, alignment: .center)
                
                VStack(spacing:20){
                    HStack{
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Sumbit")
                                .foregroundColor(.white)
                                .font(.system(size: 27))
                                .frame(width: 200, height: 50, alignment: .center)
                                .background(Color.blue)
//                                .background(Color(#colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 0.813638245)).cornerRadius(10))
                        })
                        Spacer()
                    }
                    
                    HStack(spacing:20){
                        Image("if_phone_1645999")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Image("if_whatsapp_287520")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Image("if_mail_287559")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Image("if_skype_834715")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.vertical)
                    .padding(.horizontal,40)
//                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5103735513)).cornerRadius(10))
                    Spacer()
                }

                Spacer()
            })
            .navigationTitle("Contact US")
            .ignoresSafeArea(.container, edges: .bottom)
            .padding(.horizontal)
//        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
