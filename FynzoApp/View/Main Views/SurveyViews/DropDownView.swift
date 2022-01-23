//
//  DropDownView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 29/09/21.
//

import SwiftUI

//struct DropDownContainer<Content:View>:View{
//    let content:Content
//
//    init(@ViewBuilder content:()-> Content){
//        self.content = content()
//    }
//    @Namespace var namespace
//    @State var ISShown:Bool = false
//    @State var DropDownTitle:String = ""
//
//    @State var OptionsArray:[String] = []
//
//    @State var SelectedDropDownOption:String = ""
//    var body: some View{
//        content
//        Menu {
//                VStack{
//                    ForEach(OptionsArray, id:\.self) { options in
//                        Button {
//                            SelectedDropDownOption = options
//                        } label: {
//                            Text(options)
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 20))
//                                .frame(width: 200, height: 50, alignment: .center)
//                                .background(Color.black.cornerRadius(10))
//                        }
//
//                    }
//
//                }
//            }
//        label: {
//            Text(SelectedDropDownOption.isEmpty ? "Select Option":SelectedDropDownOption)
//                    .foregroundColor(Color.white)
//                    .font(.system(size: 30))
//                    .frame(width: 250, height: 70, alignment: .center)
//                    .background(Color(red: 130/255, green: 36/255, blue: 50/255))
//            }
//
//    }
//}



struct DropDownView: View {
    @Namespace var namespace
    @State var ISShown:Bool = false
    @State var DropDownTitle:String
    
    @State var OptionsArray:[QuestionElement]
    
    @State var SelectedDropDownOption:String = ""
    var body: some View {
        VStack{
            Text(DropDownTitle)
                .fontWeight(.medium)
                .font(.system(size: 20))
                .padding()
            
        Menu {
                VStack{
//                    ForEach(OptionsArray, id:\.self) { options in
//                        Button {
//                            SelectedDropDownOption = options
//                        } label: {
//                            Text(options)
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 20))
//                                .frame(width: 200, height: 50, alignment: .center)
//                                .background(Color.black.cornerRadius(10))
//                        }
//
//                    }
                    
                    ForEach(OptionsArray,id:\.id) { choice in
                        Button {
                            SelectedDropDownOption = choice.choice!
                        } label: {
                            Text("\(choice.choice ?? "no choice")")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20))
                                .frame(width: 200, height: 50, alignment: .center)
                                .background(Color.black.cornerRadius(10))
                        }
                        
                    }
                        
                }
            }
        label: {
            Text(SelectedDropDownOption.isEmpty ? "Select Option":SelectedDropDownOption)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    .frame(width: 250, height: 70, alignment: .center)
                    .background(Color(red: 130/255, green: 36/255, blue: 50/255))
            }
            
            




        }
        .padding(.bottom,60)

    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
//        
        DropDownView(DropDownTitle: "Your gender", OptionsArray: [])
    }
}


//MARK: Older one
/*
 
 Button {
//                withAnimation {
         ISShown.toggle()
//                }
 } label: {
     Text("Select Option")
         .foregroundColor(Color.white)
         .font(.system(size: 30))
         .frame(width: 250, height: 70, alignment: .center)
//                rgba(130,36,50,255) #822432 rgb(130,36,50)
         .background(Color(red: 130/255, green: 36/255, blue: 50/255))
//                    .matchedGeometryEffect(id: namespace, in: namespace, properties: .size, anchor: .bottom, isSource: ISShown ? true : false)
 }
 if ISShown{
     VStack{
         ForEach(OptionsArray, id:\.self) { options in
             Text(options)
                 .foregroundColor(Color.white)
                 .font(.system(size: 20))
                 .frame(width: 200, height: 50, alignment: .center)
                 .background(Color.black.cornerRadius(10))
         }
             
     }
     
     
//                .matchedGeometryEffect(id: namespace, in: namespace, properties: .size, anchor: .top, isSource: ISShown ? false : true)
     
 }
 */
