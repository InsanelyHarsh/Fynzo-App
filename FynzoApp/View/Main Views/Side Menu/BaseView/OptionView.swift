//
//  OptionView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

struct OptionView: View {
 
    let name:String
    let imageName:String
    
    var body: some View {
//        VStack {
        HStack{
            
//            Image(systemName: imageName)
            Image(imageName)
                .resizable()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(name)
                .font(.headline)
            
        }
        
        
//                    VStack(alignment: .leading, spacing: 10){
//                        ForEach(0..<6, id:\.self){ i in
//                            Button(action: {
//
//                            }, label: {
//                                HStack(spacing: 20){
//                                    Image(systemName: optionArray[i])
//                                        .resizable()
//                                        .frame(width: 25, height: 25, alignment: .center)
//
//                                    Text(optionName[i])
//                                        .font(.system(size: 20, weight: .regular, design: .default))
//                                        .font(.headline)
//                                }.foregroundColor(.black)
//                            })
//                            Divider()
//                        }
//                    }
//                    .padding(.leading,30)
//                })
//        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView(name: "Demo", imageName: "house")
    }
}

