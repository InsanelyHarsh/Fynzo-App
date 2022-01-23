//
//  BaseView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import SwiftUI

struct DemoBaseView: View {
    let width = UIScreen.main.bounds.width
    let title:String
    let ButtonTitle:String
    let bgColor:Color
    let buttonColor:Color
    
    var body: some View {
        
        VStack(spacing:25){
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 25, weight: .regular, design: .rounded))
            
            HStack(){
                Spacer()
                Text(ButtonTitle)
                    .kerning(1.2)
                    .fontWeight(.regular)
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.85)))
                            .opacity(0.8)
                            .frame(width: 120, height: 40, alignment: .center)
                    )
                    .padding(.trailing,30)
                
                
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .opacity(0.5)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .frame(width: width*0.95, height: 120, alignment: .center)
        )
        .frame(width: width*0.92, height: 100, alignment: .center)
        .padding()
        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        DemoBaseView(title: "Restaurant Customer FeedBack", ButtonTitle: "START", bgColor: Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 0.85)), buttonColor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
    }
}
