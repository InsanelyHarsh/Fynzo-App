//
//  FeedBackView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

struct FeedBackView: View {
    let SurveyTitle:String
    @StateObject var VM:SurveyFormListingsViewModel

    let width = UIScreen.main.bounds.width
    var body: some View {
        VStack{
//            VStack(alignment: .leading){
                
//                        Text(SurveyTitle)
//                            .foregroundColor(.black)
//                            .font(.system(size: 25, weight: .regular, design: .rounded))
//                            .padding(.leading,20)
                        
                        HStack(spacing:20){
                            
                            Text(SurveyTitle)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular, design: .rounded))
                                .padding(.leading,20)
                            
                            
                            Spacer()

                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(lineWidth: 3, antialiased: true)
                                    .foregroundColor(Color.blue)
                                    .frame(width: 85, height: 45, alignment: .center)

//                                RoundedRectangle(cornerRadius: 15)
//                                    .foregroundColor(Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.85)))
//                                    .opacity(0.8)
//                                    .frame(width: 120, height: 40, alignment: .center)
                                
                                Text("START")
                                    .kerning(1.2)
                                    .fontWeight(.regular)
                                    .font(.system(size: 20, weight: .regular, design: .rounded))
                                    .foregroundColor(.black)
                            }
//                            .padding(.leading,15)

                            
                            Image("iconfinder_menu2_309052")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
//                                .padding(.leading,30)
                            
                            
//                            ZStack {
//
//                                Image(systemName: "chevron.down.circle.fill")
//                                    .resizable()
//                                    .frame(width: 35, height: 35, alignment: .center)
//                                    .padding(.leading,30)
//                                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
//
//                            }.frame(width:100)
                            
                            
                        }
                        .frame(height:50)
            
                
//                        Spacer()
//                    }
//                    .frame(height: 100, alignment: .center)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .opacity(0.5)
//                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
//                            .frame(height: 120, alignment: .center)
//                )
        }
        
    }
}

struct FeedBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBackView(SurveyTitle: "Restaurant Customer FeedBack", VM: SurveyFormListingsViewModel())
    }
}

