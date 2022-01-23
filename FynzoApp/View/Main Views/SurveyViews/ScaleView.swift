//
//  ScaleView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI



struct ScaleView: View {
    @State var Index:Int = 0
    @State var ScaleStatement:String
    @State var NumberofStars:String
    @State var Label:String
    var body: some View {
        ZStack{
            VStack{
                Text(ScaleStatement)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .padding()
                
                HStack(spacing: 1){
                    let scale = Int(NumberofStars)
                    ForEach(1...scale! , id:\.self) { index in
                        if Index == index{
                            ZStack{
                                Rectangle()
                                    
                                    .frame(height: 50, alignment: .center)

                                
                                Text("\(index)")
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                Index = index
                            }
                            
                        }
                        else{
                            ZStack{
                                ZStack{
//                                    Color.red
//                                        .frame( height: 50, alignment: .center)
                                    
                                    Rectangle()
                                        .stroke()
                                        .frame( height: 50, alignment: .center)
                                }
                                    
                                Text("\(index)")
                            }
                            .onTapGesture {
                                Index = index
                            }
                        }
                        
                    }
                }
                .padding()
                Text(Label)
                    .scaledToFit()
                
                Text("\(Index)")
            }
            .padding(.bottom,80)

        }
    }
}

struct ScaleView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleView(ScaleStatement: "how do you feel", NumberofStars: "11",Label: "")
    }
}
