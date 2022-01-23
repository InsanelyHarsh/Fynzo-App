//
//  SmileyFaceView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI

struct SmileyFaceView: View {
//    enum SimelyName:String{
//        case verysad = "😔"
//        case sad = "☹️"
//        case ok = "😐"
//        case happy = "🙂"
//        case veryHappy = "😁"
//    }
    
//    let SimelyArray = ["😔","☹️","😐","🙂","😁"]
    let SimelyArray = ["iconfinder_1","iconfinder_2","iconfinder_3","iconfinder_4","iconfinder_5"]
    @State var Selected:Bool = false
    @State var SelectedOption:String = ""
    
    @State var QuestionText:String
    @State var Scale:Int = 5
    @State var Label:String
    
    
    var body: some View {
        
        let LabelArray = Label.components(separatedBy: ",")
        
        ZStack{
            VStack(spacing:30){
                
                Text(QuestionText)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
                VStack {
                    HStack(spacing:20){
                        
                        ForEach(SimelyArray, id:\.self) { simely in
                            VStack{
                                Button(action: {
                                    SelectedOption = simely
                                    Selected.toggle()
                                    
                                }, label: {
                                    if SelectedOption == simely{
                                        Image(simely)
                                            .resizable()
                                            .scaledToFit()

                                    }
                                    else{
                                        Image(simely)
                                            .resizable()
                                            .scaledToFit()
                                            .opacity(0.6)
                                    }
                                })
                            }
                        }
                    }
                    .padding()
                .font(.system(size: 55))
                    
                    HStack(spacing:20){
                        
                        ForEach(LabelArray, id:\.self) { simely in
                            VStack{
                                Text(simely)
                                    .font(.system(size: 15))
                            }
                        }
                    }
                    .padding()

                }
                
                
                
               
                
//                Text(SelectedOption)
//                    .font(.system(size: 65))

//                Text("Next")
//                    .foregroundColor(.white)
//                    .font(.system(size: 30))
//                    .frame(width: 150, height: 80, alignment: .center)
//                    .background(Color.blue.cornerRadius(10))
                
                Spacer()
            }
//            .padding(.top,40)
            .padding(.bottom,80)

        }
        .foregroundColor(.black)
    }
}

struct SmileyFaceView_Previews: PreviewProvider {
    static var previews: some View {
        SmileyFaceView(QuestionText: "How was the Food?",Label: "Very Bad,Bad,Average,Good,Very good")
    }
}

//struct Testing<T:String>{
//    let x:T
//    func printTheX(input:String){
//        print("\(input)")
//    }
//}
//Type 'T' constrained to non-protocol, non-class type 'String'


struct alpha{
    func Testing02<T:Numeric>(input:T){
        print("\(input)")
    }
}

struct CustomView<T:View>:View{
    let content:T
    var body: some View{
        Text("d")
        VStack{
            content
                .foregroundColor(Color.red)
        }
    }
}

struct CustomViewUsingVB<T:View>:View{
    let customContent:T
//    let inputStrint:String
    
    init(@ViewBuilder CustomContent:()->T){
        customContent = CustomContent()
    }
    
    var body: some View{
        VStack{
            Text("Custom View Using View Builder")
            customContent
        }
    }
}
