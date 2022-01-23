//
//  CheckListView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI

struct CheckListView: View {
    @State var CheckListTitle:String
    @State var CheckListOptionArray:[QuestionElement]
    @State var questionId:String
    
    var body: some View {
        VStack(alignment: .leading,spacing:20){
            HStack{
                Spacer()
                
                Text(CheckListTitle)
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                    .padding()
                
                Spacer()
            }
            VStack{
                
//                ForEach(CheckListOptionArray, id:\.self){ i in
//                    HStack{
//                        CheckBoxView(IsSeclected: false)
//                        Text(i)
//                            .font(.title)
//                        Spacer()
//                    }
//                }
                
                ForEach(CheckListOptionArray, id:\.id) { choice in
                    HStack{
                        CheckBoxView(IsSeclected: false)
                        
                        Text(choice.choice ?? "no choice")
                            .font(.title)
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom,80)
//        .padding(.vertical,40)
        .padding(.leading)
        
        
        
        
//            .onAppear {
//                Networking().GetSurveyFormDetails(RequestURL: "https://feedback.fynzo.com/webservices/surveyform", UserID: 29045, SurveyFormID: 11592) { (result:Result<ResponseSurveyFormDetailModel,Networking.POSTNetworkError>) in
//                    switch result{
//                    case .success(let x):
//                        let y = x.data.questionnaire
//                        for i in y{
//                            switch i.question{
//                            case .none:
//                                print("")
//                            case .some(let aa):
//                                switch aa{
//                                case .purpleQuestion(let purpleQuestion):
//                                    print(purpleQuestion.isNps ?? "<>")
//                                    print(purpleQuestion.shape ?? "<>")
//                                case .questionElementArray(let questionElementArray):
//                                    for z in questionElementArray{
//                                        print(z.choice ?? "><")
////                                        if i.questionTypeID == "2"{
////                                            CheckListChoiceArray.append(z.choice ?? "")
////                                        }
////                                        if i.questionTypeID == "3"{
////                                            RadioButtonChoiceArray.append(z.choice!)
////                                        }
//                                    }
////                                    print(questionElementArray)
//                                }
//                            }
//                        }
////                        questionnaire = x.data.questionnaire
////                        for al in x.data.questionnaire{
////                            ScreenNumberArray.append(al.screenNo ?? "")
////                        }
////                        print(ScreenNumberArray)
//                    case .failure(let er):
//                        print(er)
//                    }
//                }
//            }
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
//        ["Online","offline","Word of Mouth","Hoardings"]
        CheckListView(CheckListTitle: "How did You Know About US?", CheckListOptionArray: [], questionId: "question id here")
    }
}
