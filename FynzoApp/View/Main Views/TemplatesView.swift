//
//  TemplatesView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 07/09/21.
//

import SwiftUI

struct TemplatesView: View {
    
    let array = ["Restaurant","Hotel & Resort","Beauty & Fitness","Healthcare","Net Promoter","Events"]
    var body: some View {
        ZStack{
//            Image("background9")
//                .resizable()
//                .ignoresSafeArea()
//                .blur(radius: 100)
            
            VStack(alignment:.leading,spacing:20){
                HStack{
                    Text("Template")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .padding(.leading,20)
                    Spacer()

                }
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible())]
                              , alignment: .center, spacing: 50, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
                                ForEach(array,id:\.self) { i in
                                    VStack{
                                        Image("SampleUser")
                                            .resizable()
                                            .frame(width: 165, height: 185, alignment: .center)
                                        
                                        Text(i)
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    .cornerRadius(10)
                                    .padding(.bottom,10)
                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
//                                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5103735513)).cornerRadius(10))

                                }
                    })
                })
                
                Spacer()
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .padding(.horizontal)
        }
    }
}

struct TemplatesView_Previews: PreviewProvider {
    static var previews: some View {
        TemplatesView()
    }
}
