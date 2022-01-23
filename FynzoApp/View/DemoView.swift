//
//  DemoView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 01/10/21.
//

import SwiftUI
/*
 SurveyViews(questionTypeID: value, isNps: "", shape: "", statement: "hello", ChoiceArray: [], isTextBox: "1")
 */
/*
 let sd:[Questionnaire] = dic.values.flatMap{$0}
 ForEach(sd, id:\.id) { j in
     Text(j.questionText!)
     
 }
 */
struct Elements{
    var questionTypeID:String
    var isNps:String
    var shape:String
    var statement:String
    var choiceArray:[String]
    var isTextBox:String
}

enum questionTypeID:String{
    case StateMent = "0"
    case TextField = "1"
    case CheckBox = "2"
    case RadioButton = "3"
    case DropDown = "4"
    case Scales = "5"
    case CommingSoon = "6"
    case CommingSoon1 = "7"
    case CommingSoon2 = "8"
}

struct Model:Equatable{
    var unique = UUID().uuidString
    var isRequired:Bool
    var Response:String
    var questionID:String
    var questionTypeID:String
}

class ViewM:ObservableObject{
    var isRequired:Bool
    var Response:String
    var questionID:String
    var questionTypeID:String
    static var finalArray:[Model] = []
    init(isRequired:Bool = false,Response:String = "",questionID:String = "",questionTypeID:String = ""){
        self.isRequired = isRequired
        self.Response = Response
        self.questionID = questionID
        self.questionTypeID = questionTypeID
    }
    
//    func Add(isRequired:Bool,Response:String,questionID:String,questionTypeID:String){
//        finalArray.append(Model(isRequired: isRequired, Response: Response, questionID: questionID, questionTypeID: questionTypeID))
//        print("Updated: \(finalArray)")
//    }
}
/**
 questionnaire is Array of All the quesions
 
 
```
 //MARK: questionId:questionTypeID pairs
 dictionarys: ["155083": "0", "155077": "1", "155070": "5", "155076": "0", "155086": "4", "155074": "5", "155068": "0", "155071": "5", "155088": "5", "155067": "0", "155069": "3", "155075": "2", "155079": "1", "155081": "7", "155078": "1", "155072": "5", "155080": "3", "155082": "7", "155087": "8", "155098": "9", "155099": "6", "155085": "5", "155084": "1", "155073": "5"]
 
 
 //MARK: every inner array represents particular screen and inside inner arrays contains questionID of question that belong to that question
 Lists : [["155067", "155068"], ["155069", "155086", "155088"], ["155070"], ["155083"], ["155085"], ["155075"], ["155084"], ["155071", "155076", "155077", "155078", "155079"], ["155072", "155080"], ["155073", "155081", "155082"], ["155074"], ["155087"], ["155098"], ["155099"]]
 
 ```
 */
struct DemoView: View {
    
    enum questionTypeID:String{
        case StateMent = "0"
        case TextField = "1"
        case CheckBox = "2"
        case RadioButton = "3"
        case DropDown = "4"
        case Scales = "5"
        case CommingSoon = "6"
        case CommingSoon1 = "7"
        case CommingSoon2 = "8"
    }
    
    @State var CustomFontColor:Color = .black
    
    @State var questionnaire:[Questionnaire] = []
    
    @State var Lists:[[String]] = [[]]
    
    @State var dictionarys:[String:String] = [:]
    
    @State var ScreenNumber:Int = 1
        
    var screens :Int = 0

    @State var surveyform_id:Int
    
//MARK: List => [innerArray,innnerArray]
//MARK: inner array => [id] (question id)
    
    
//MARK: Dictionarys => key: id, value: questionTypeID
//MARK: dictionarys are pair of question id and questiontypeID

//    var surveyViewLogic = SurveyViewLogic()
/*
 Image("hotel")
     .resizable()
     .scaledToFill()
     .opacity(0.4)
 */
    var body: some View {
         ZStack{
             Image("hotel")
                 .resizable()
//                 .scaledToFill()
                 .opacity(0.4)
                 .ignoresSafeArea()
             ScrollView(.vertical, showsIndicators: false){
                
                VStack{
                    //MARK: Buttons
                    ButtonsView(ScreenNumber: $ScreenNumber)
                        .padding()
                    
                    
                    //MARK: Surveys
                    ForEach(Lists.indices, id:\.self){ screenNumber in
                        
                        //MARK: condition for which screen has to be shown
                        if screenNumber + 1 == ScreenNumber{
                            VStack {
                                ForEach(Lists[screenNumber], id:\.self){ questionID in
                                    VStack{
                                        
                                        ForEach(questionnaire, id:\.id){ que in
                                            
                                            ForEach(ViewM.finalArray.indices){ final in
                                                
                                                //Displaying question on screen from they belong basically
                                                if (que.id! == questionID) && (ViewM.finalArray[final].questionID == questionID){
                                                    
                                                    switch que.question{
                                                        //now seprating on the basics of type of question they are i.e. question is array(example:in the cases of radioButton) or object(example: simely and other scales)
                                                        
                                                    case .none:
                                                        Text("?")
                                                        
                                                    case .some(let some):
                                                        switch some{
                                                            
                                                        case .purpleQuestion(let purpleQuestion):
                                                            
                                                            
                                                            SurveyViewLogic().SurveyViews(questionTypeID: que.questionTypeID ?? "", isNps: purpleQuestion.isNps ?? "", shape: purpleQuestion.shape ?? "", statement: que.questionText ?? "no question Text", ChoiceArray: [], isTextBox: purpleQuestion.isTextbox ?? "", scale: purpleQuestion.scale ?? "",labels:purpleQuestion.labels ?? "",questionID:que.id ?? "",index:final,Rating:ViewM.finalArray)
                                                            
                                                        case .questionElementArray(let questionElementArray):
                                                            
                                                            
                                                            SurveyViewLogic().SurveyViews(questionTypeID: que.questionTypeID ?? "", isNps: "", shape: "", statement: que.questionText ?? "no question Text", ChoiceArray: questionElementArray, isTextBox: "", scale: "",labels:"",questionID:que.id ?? "",index:final, Rating:ViewM.finalArray)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Surveys")
        }
//         .onAppear(perform: {
////             Demo02ViewModel().networking()
//         })
        .onAppear {
            
            Networking().GetSurveyFormDetails(RequestURL: "https://feedback.fynzo.com/webservices/surveyform", UserID: 29045, SurveyFormID: surveyform_id) { (result:Result<ResponseSurveyFormDetailModel,Networking.POSTNetworkError>) in
                switch result{
                case .success(let x):
                    
                    var lists:[[String]] = [[]]
                    var innerArrray:[String] = []
//MARK: List => [innerArray,innnerArray]
//MARK: inner array => [id]
                    
//MARK: Dictionarys => key: id, value: questionTypeID
                    var screen:String = "0"
                    

                    let questionnaireArray = x.data.questionnaire
                    
                    DispatchQueue.main.async {
                        
                        for al in x.data.questionnaire{

                            ViewM.finalArray.append(Model(isRequired: false, Response: "nil", questionID: al.id ?? "-", questionTypeID: al.questionTypeID ?? ""))
                        }

                        print("-->\(ViewM.finalArray)")
                        print(">>>>>>>>>>>>>>\(x.data.surveyform.name ?? "") \n")
                        
                        for i in questionnaireArray{
                            dictionarys[i.id!] = i.questionTypeID!
                            
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
                        }
                        print("dictionarys: \(dictionarys)")
                    }
                    DispatchQueue.main.async {
                        Lists = lists.filter({return $0 != []})
                        print("Lists : \(Lists)")
                    }
                case .failure(let er):
                    print(er)
                }
            }
        }
    }
}

//MARK: Preview
struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView(surveyform_id: 11592)
    }
}


struct ButtonsView:View{
    @Binding var ScreenNumber:Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        HStack{
            
            if ScreenNumber == 1{
                Button {
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    VStack{
                        Text("Exit")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Rectangle().foregroundColor(Color(red: 130/255, green: 36/255, blue: 50/255)).frame(width: 40, height: 30, alignment: .center))

                    }
                }
            }
            
            else{
                Button {
                    withAnimation{
                        ScreenNumber = ScreenNumber - 1
                    }
                    
                } label: {
                    VStack{
                        Image("backward")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color(red: 130/255, green: 36/255, blue: 50/255))
                        
                        Text("Prev")
                            .foregroundColor(Color(red: 130/255, green: 36/255, blue: 50/255))

                    }
                }
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    ScreenNumber = ScreenNumber + 1
                }
            } label: {
                VStack{
//                            Image(systemName: "chevron.forward.circle.fill")
                    Image("forward")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color(red: 130/255, green: 36/255, blue: 50/255))
                    
                    Text("Next")
                        .foregroundColor(Color(red: 130/255, green: 36/255, blue: 50/255))
                }
            }
        }
    }
}
