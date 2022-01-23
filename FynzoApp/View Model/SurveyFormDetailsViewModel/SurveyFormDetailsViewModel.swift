//
//  SurveyFormDetailsViewModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 27/09/21.
//

import Foundation



class SurveyFormDetailsViewModel:ObservableObject{
    //UserID: 29045, SurveyFormID: 11592
    @Published var questionT:String = ""
    @Published var questionText = [String]()
    
    
    @Published var dictionarys:[String:String] = [:]
    @Published var questionnaire:[Questionnaire] = []
    @Published var Lists:[[String]] = [[]]
    
    func GET(UserID:Int,SurveyFormID:Int){
        Networking().GetSurveyFormDetails(RequestURL: "https://feedback.fynzo.com/webservices/surveyform", UserID: UserID, SurveyFormID: SurveyFormID) { (result:Result<ResponseSurveyFormDetailModel,Networking.POSTNetworkError>) in
            switch result{
            case .success(let x):
                
                var lists:[[String]] = [[]]
                var innerArrray:[String] = []
                var screen:String = "0"
                
                
                let questionnaireArray = x.data.questionnaire
                
                DispatchQueue.main.async {
                    self.questionnaire = x.data.questionnaire

                    for i in questionnaireArray{
//                            dictionarys[i.id!] = questionnaire
                        self.dictionarys[i.id!] = i.questionTypeID!
                        screen = "\(Int(screen)! + 1)"

                        for j in questionnaireArray{
                            if screen == j.screenNo!{
                                innerArrray.append(j.id!)
                            }
                            if screen != j.screenNo!{
                                lists.append(innerArrray)
                                innerArrray = []
                                if Int(screen)! < Int(j.screenNo!)!{
                                    break
                                }
                            }
                        }

                        switch i.question{
                        case .none:
                            print(">>>Error")
                        case .some(let aa):
                            switch aa{
                            case .purpleQuestion(let purpleQuestion):
                                print(purpleQuestion)

                            case .questionElementArray(let questionElementArray):
                                for z in questionElementArray{
                                    print(z.choice ?? "><")
                                }
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.Lists = lists.filter({return $0 != []})
                }
            case .failure(let er):
                print(er)
            }
        }
    }
    
    
    
    
    
    func GetSurveyFormDetails(UserID:Int,SurveyFormID:Int)
    {
        print(self.questionText)
       
        Networking().GetSurveyFormDetails(RequestURL: "https://feedback.fynzo.com/webservices/surveyform", UserID: 29045, SurveyFormID: 11592) { (result:Result<ResponseSurveyFormDetailModel,Networking.POSTNetworkError>) in
            switch result{
            
            case .success(let x):
                DispatchQueue.main.async {
                    self.questionT = x.data.questionnaire[0].questionText ?? "<>"
                }
               
                
                for i in x.data.questionnaire{
                    
                    self.questionText.append(i.questionText ?? "<>")
//                    print("Question Text: \(i.questionText ?? "<>")" )
//                    print("QuestionTypeID : \(i.questionTypeID ?? "<>")")
                }

            case .failure(let er):
                print(er)
            }
        }
    }
}



class SuveyFormDetailsData{
    
    let responseSurveyFormDetailModel : ResponseSurveyFormDetailModel

    init(ResponseSurveyFormDetail:ResponseSurveyFormDetailModel){
        responseSurveyFormDetailModel = ResponseSurveyFormDetail
    }
    
    var status:Bool{
        return responseSurveyFormDetailModel.status
    }
    
    var msg:String{
        return responseSurveyFormDetailModel.msg
    }
    
    var data:DataClas{
        return responseSurveyFormDetailModel.data
    }
    
}
