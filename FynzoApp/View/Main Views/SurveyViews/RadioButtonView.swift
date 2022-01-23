//
//  RadioButtonView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 30/09/21.
//

import SwiftUI

struct RadioButtonView: View {
    @State var RadioButtonTittle:String
    @State var RadioButtonChoiceArray:[QuestionElement]
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    var body: some View {
        VStack {
            
            Text(RadioButtonTittle)
                .fontWeight(.medium)
                .font(.system(size: 20))
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                
                ForEach(RadioButtonChoiceArray,id:\.id) { choice in
                    Button {
                        
                    } label: {
                        Text(choice.choice ?? "no Choice")
                            .font(.system(size: 20))
                            .frame(width: 150, height: 60, alignment: .center)
                            .background(Color(red: 130/255, green: 36/255, blue: 50/255))
                            .padding(.horizontal)
                            .foregroundColor(Color.white)
                    }

                }
//                ForEach(RadioButtonChoiceArray,id:\.self) { i in
//                    Button {
//
//                    } label: {
//                        Text(i)
//                            .font(.system(size: 20))
//                            .frame(width: 150, height: 60, alignment: .center)
//                            .background(Color(red: 130/255, green: 36/255, blue: 50/255))
////                            .background(Color.red)
//                            .padding(.horizontal)
//                            .foregroundColor(Color.white)
//                    }
//
//                }
                
            }
        }
        .padding(.bottom,80)

        
        
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
//        ["Excellent","Good","Average","Dissatified"]
        RadioButtonView(RadioButtonTittle: "How was the Food Quality", RadioButtonChoiceArray: [])
    }
}
