//
//  Demo02View.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 28/11/21.
//

import SwiftUI

struct Demo02View: View {
    
    @StateObject var Demovm = Demo02ViewModel()
    @State var screen:String = "1"
    @State var hear:Int = 0
    
    @Environment(\.presentationMode) var presentationMode

    @State var surveyFormID:Int?
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                HStack{
                    if Int(screen)! > 1{
                        Button("go back"){
                            screen = "\(Int(screen)! - 1)"
                        }.padding()
                    }
                    else{
                        Button {
                            presentationMode.wrappedValue.dismiss()
//                            surveyFormID = 0
                            surveyFormID = nil
                            SurveyResponse.shared.responseArray = []
                        } label: {
                            VStack{
                                Text("Exit")
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .background(Rectangle().foregroundColor(Color(red: 130/255, green: 36/255, blue: 50/255)).frame(width: 40, height: 30, alignment: .center))

                            }
                        }
                    }
                    
                    Spacer()
                    
                    if Int(screen)! < Demovm.secList.count{
                        Button("go next"){
                            screen = "\(Int(screen)! + 1)"
                        }.padding()
                    }
                }
                
                if Demovm.isLoading{
                    VStack{
                        ProgressView()
                        Text("Loading your survey")
                    }
                }
                if !Demovm.isLoading{
                    ForEach(0..<Demovm.secList.count) { scre in
                        if screen == "\(scre+1)"{
                            ForEach(Demovm.secList[scre],id:\.id) { j in
                                switch j.question{
                                    
                                case .purpleQuestion(let purple):
                                    Demovm.DetailView(questionTypeID: j.questionTypeID, arrayData: nil, objectData: purple,question: j)
                                    
                                case .questionElementArray(let array):
                                    Demovm.DetailView(questionTypeID: j.questionTypeID, arrayData: array, objectData: nil,question:j)
                                    
                                case .none:
                                    Text("none")
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                if let surveyFormID = surveyFormID {
                    Demovm.networking(SurveyFormID: surveyFormID)
                }
                else{
                    print("an error u")
                }
            }
        }
    }
}

struct Demo02View_Previews: PreviewProvider {
    static var previews: some View {
        Demo02View(surveyFormID: 11592)
    }
}
