//
//  DemoSurveyView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import SwiftUI

struct DemoSurveyView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            VStack(alignment:.leading){
                HStack {
                    Text("Demo Surveys")
                        .font(.system(size: 35))
                        .fontWeight(.medium)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Close")
                            .font(.system(size: 20))
                            .padding(.bottom,25)
                            .padding(.trailing,25)
                    })
                }
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(){
                        ForEach(0..<9) { i in
                            Button(action: {
                                
                            }, label: {
                                DemoBaseView(title: "Restaurant Customer FeedBack", ButtonTitle: "START", bgColor: Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.85)), buttonColor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            })
                        }
                    }
                    .background(Color.white.cornerRadius(20))
                })
                Spacer()
            }.ignoresSafeArea(.container, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            
            
            /// *Chat View*
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "message.circle")
                            .resizable()
                            .frame(width: 55, height: 55, alignment: .center)
                            .foregroundColor(.blue)
                            .padding([.leading,.bottom],25)
                    })
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct DemoSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        DemoSurveyView()
        
    }
}
