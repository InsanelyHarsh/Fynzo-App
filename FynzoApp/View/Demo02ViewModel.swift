//
//  Demo02View.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 28/11/21.
//

import Foundation
import SwiftUI

struct jsModel:Decodable{
    var name:String
    var age:Int
}

struct javaScrpt{
    func server(){
        Networking().getJSON(urlString: "http://localhost:3000/data") { (result:Result<jsModel,Networking.NetworkError>) in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print("")
            }
        }
    }
}

//http://localhost:3000/data

struct Question:Equatable,Hashable{
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.questionID == rhs.questionID
        && lhs.surveyFormID == rhs.surveyFormID
        && lhs.screenNo == rhs.screenNo
        && lhs.questionTypeID == rhs.questionTypeID
        && lhs.isCompulsory == rhs.isCompulsory
        && lhs.questionText == rhs.questionText
        && lhs.questionNo == rhs.questionNo
        && lhs.question == rhs.question
//        && lhs.dquestion == rhs.dquestion
    }
    
    var id = UUID().uuidString
    var questionID: String
    var surveyFormID: String
    var screenNo: String
    var questionNo: String
    var questionText: String
    var isCompulsory: String
    var questionTypeID: String
    
    var question: QuestionUnion?
//    var dquestion: [Dquestions]
}


class Demo02ViewModel:ObservableObject{
    
//    var surveyFormID:Int?
    
    @Published var secList:[[Question]] = [[]]
    @Published var isLoading:Bool = true

//    init(surveyFormID:Int){
//        self.surveyFormID = surveyFormID
//        print("surveyid: \(surveyFormID)")
//
//        networking(SurveyFormID: surveyFormID)
//    }
    
    func networking(SurveyFormID:Int){
        
        var screen:String = "0"
        var lists:[[String]] = [[]]
        var innerArrray:[String] = []
        
        var secInnerArray:[Question] = []
        print("*****\(SurveyFormID)*****")
        Networking().GetSurveyFormDetails(RequestURL: "https://feedback.fynzo.com/webservices/surveyform", UserID: 29045, SurveyFormID: SurveyFormID) { (result:Result<ResponseSurveyFormDetailModel,Networking.POSTNetworkError>) in
            switch result{
            case .success(let finalData):
                DispatchQueue.main.async { [weak self] in
                    print("we got survey for:\(finalData.data.surveyform.id ?? "nil")")
                    let questionnaireArray = finalData.data.questionnaire //array of question array
                    
                    for _ in questionnaireArray{
                        
                        screen = "\(Int(screen)! + 1)"
                        
                        for j in questionnaireArray{
                            
                            if screen == j.screenNo!
                            {
    //                            secInnerArray.append(j)
                                secInnerArray.append(Question(questionID: j.id ?? "-", surveyFormID: j.surveyFormID ?? "-", screenNo: j.screenNo ?? "-", questionNo: j.questionNo ?? "-", questionText: j.questionText ?? "-", isCompulsory: j.isCompulsory ?? "-", questionTypeID: j.questionTypeID ?? "-", question: j.question))
                                
                                SurveyResponse.shared.responseArray.append(SurveyResponseModel(questionID: j.id ?? "-", surveyFormID: j.surveyFormID ?? "-", questionTypeID: j.questionTypeID ?? "-", userResponse: nil))
                                
                                innerArrray.append(j.id!)
                            }
                            
                            if screen != j.screenNo!
                            {
                                self?.secList.append(secInnerArray)
                                secInnerArray = []
                                
                                lists.append(innerArrray)
                                innerArrray = []
                                
                                if Int(screen)! < Int(j.screenNo!)!{
                                    break
                                }
                            }
                        }
                    }
                    self?.secList = self?.secList.filter{return $0 != []} ?? []
                    self?.isLoading = false
                    print("this is response array without response : \(SurveyResponse.shared.responseArray)")
                }
            case .failure(let er):
                print(er)
            }
        }
    }
}


extension Demo02ViewModel{
    @ViewBuilder
    func DetailView(questionTypeID:String,arrayData:[QuestionElement]?,objectData:PurpleQuestion?,question:Question)->some View{
        
        switch questionTypeID{
        case "0","2","3","4","6","7","8","9":
            if let arrayData = arrayData{
                    ArrayTypeDetailView(typeid: questionTypeID,arrayData: arrayData,question:question)
            }
        case "1","5":
            if let objectData = objectData{
                    ObjectTypeDetailsView(typeid: questionTypeID, objectData: objectData,question:question)
            }
        default:
             Text("Unkown Type")
        }
    }
    
    @ViewBuilder
    func ArrayTypeDetailView(typeid:String,arrayData:[QuestionElement],question:Question)->some View{
        switch typeid {
        case "0":
            SurveyStatement(Statement: question.questionText)
        case "2":

            CheckListView(CheckListTitle: question.questionText, CheckListOptionArray: arrayData, questionId: question.questionID)
        case "3":
            RadioButtonView(RadioButtonTittle: question.questionText, RadioButtonChoiceArray: arrayData)
            
        case "4":
            DropDownView(DropDownTitle: question.questionText, OptionsArray: arrayData)
            
        case "6":
             Text("last six")
            
        default:
             Text("unknown type")
        }
    }
    
    @ViewBuilder
    func ObjectTypeDetailsView(typeid:String,objectData:PurpleQuestion,question:Question)->some View{
        switch typeid {
        case "1":
            if objectData.isTextbox == "1"{
                LongTextView()
            }
            if objectData.isTextbox == "0"{
                StatementView(Entry: "", EntryTitle: question.questionText)
            }
            
        case "5":
            if objectData.isNps == "0" && objectData.shape == "0"{
                NewRatingView(Rating: 2, ratingQuestion: question.questionText, NumberofStars: objectData.scale ?? "4", Label: objectData.labels ?? "")
            }
            if objectData.isNps == "1" && objectData.shape == "0"{
                ScaleView(Index: 3, ScaleStatement: question.questionText, NumberofStars: objectData.scale ?? "10", Label: objectData.labels ?? "")
            }
            if objectData.isNps == "0" && objectData.shape == "1"{
                if let label = objectData.labels{
                    SmileyFaceView(QuestionText: question.questionText, Label: label)
                }
            }
            
        default:
            Text("unknown type")
        }
    }
}





struct SurveyResponseModel{
    var questionID: String
    var surveyFormID: String
    var questionTypeID: String
    
    var userResponse:String? = "no response"
}

class SurveyResponse:ObservableObject{
    static let shared = SurveyResponse()
    private init(){
        
    }
    @Published var responseArray:[SurveyResponseModel] = []
}
