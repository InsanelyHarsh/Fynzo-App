////
////  SurveyOptionView.swift
////  SurveyApp
////
////  Created by Harsh Yadav on 16/09/21.
////
///*
// ForEach(ScreenNumberArray.indices,id:\.self){ a in
//     if (a>0) && (a <= ScreenNumberArray.count) {
//         if(ScreenNumberArray[a] == ScreenNumberArray[a-1]){
//             HStack{
//                 Text("same")
//                 Text("\(Int(ScreenNumberArray[a])!)")
//             }
//         }
//         else{
//             HStack{
//                 Text("different")
//                 Text("\(Int(ScreenNumberArray[a])!)")
//             }
//         }
//     }
// }
// */
//import SwiftUI
//
//struct SurveyOptionView: View {
//    enum Screen:String{
//        case First = "1"
//        case Second = "2"
//        case Third = "3"
//        case Fourth = "4"
//        case Fifth = "5"
//        case Sixth = "6"
//        case Seventh = "7"
//        case Eight = "8"
//        case Nineth = "9"
//    }
//    
//    enum questionTypeID:String{
//        case StateMent = "0"
//        case TextField = "1"
//        case CheckBox = "2"
//        case RadioButton = "3"
//        case DropDown = "4"
//        case Scales = "5"
//        case CommingSoon = "6"
//        case CommingSoon1 = "7"
//        case CommingSoon2 = "8"
//    }
//
//    //    SurveyOptionView.questionTypeID.StateMent.rawValue
//    
//    func Screen(ScreenNumber:Screen.RawValue){
//        if ScreenNumber == "1"{
//            
//        }
//        if ScreenNumber == "2"{
//            
//        }
//    }
//    @ViewBuilder
//    func SurveyViews(questionTypeID:questionTypeID.RawValue,isNps:String,shape:String,statement:String,ChoiceArray:[String],isTextBox:String)-> some View{
//        if questionTypeID == "0"{
//            SurveyStatement(Statement: statement)
//        }
//        if questionTypeID == "1"{
//            if isTextBox == "1"{
//                LongTextView(UserText: "Write")
//            }
//            if isTextBox == "0"{
//                StatementView(Entry: "Enter", EntryTitle: statement)
//            }
//        }
//        if questionTypeID == "2"{
//            CheckListView(CheckListTitle: statement, CheckListOptionArray: ChoiceArray)
//        }
//        if questionTypeID == "3"{
//            RadioButtonView(RadioButtonTittle: statement, RadioButtonChoiceArray: ["Excellent","Good","Average","Dissatified"])
//        }
//        if questionTypeID == "4"{
//            DropDownView(DropDownTitle: statement, OptionsArray: [])
//        }
//        if questionTypeID == "5"{
//            if (isNps == "0") && (shape == "0"){
//                RatingView(Rating:2, ratingQuestion: statement, NumberofStars: "", Label: "")
//            }
//            if (isNps == "1") && (shape == "0"){
//                ScaleView(Index: 4, ScaleStatement: statement, NumberofStars: "", Label: "")
//            }
//            if (isNps == "0") && (shape == "1"){
//                SmileyFaceView(QuestionText: statement, Label: "")
//            }
//        }
//        //        if questionTypeID == "6"{
//        //            return "CommingSoon"
//        //        }
//        //        if questionTypeID == "7"{
//        //            return "CommingSoon"
//        //        }
//        //        if questionTypeID == "8"{
//        //            return "CommingSoon"
//        //        }
//    }
////    @State var Vms : ResponseSurveyFormDetailModel?
//
//    @State var questionTextArray:[String] = []
//    @State var questionnaire:[Questionnaire] = []
//    @State var QuestionID:String = ""
//    @State var ScreenNumberArray :[String] = [""]
//    @State var CheckListChoiceArray:[String] = []
//    @State var RadioButtonChoiceArray:[String] = []
//    
//    
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false, content: {
//            VStack(alignment:.center,spacing:30){
//                Text("df")
//                    ForEach(questionnaire, id:\.id){i in
//                        VStack{
//
//                            switch i.question{
//                            case .none:
//                                Text("><")
//                            case .some(let aa):
//                                switch aa{
//                                case .purpleQuestion(let purple):
//
//                                    SurveyViews(questionTypeID: i.questionTypeID!, isNps:purple.isNps ?? "", shape: purple.shape ?? "", statement: i.questionText ?? "", ChoiceArray: [], isTextBox: purple.isTextbox ?? "")
//
//                                case .questionElementArray(let questionEl):
//
//                                    SurveyViews(questionTypeID: i.questionTypeID!, isNps:"", shape: "", statement: i.questionText ?? "", ChoiceArray: CheckListChoiceArray, isTextBox: "")
//                                        VStack(spacing:0){
//
//                                    ForEach(questionEl , id:\.id) {
//                                                i in
//                                        Text(i.choice!)
//                                            }
//                                        }
//
//                                }
//                            }
//                        }
//                        //                    Divider()
//                    }
//                
//                .navigationTitle("Surveys")
//            }
//            
//            .onAppear(perform: {
////                SurveyListVM.GetSurveyQuestion()
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
//                                        if i.questionTypeID == "2"{
//                                            CheckListChoiceArray.append(z.choice ?? "")
//                                        }
////                                        if i.questionTypeID == "3"{
////                                            RadioButtonChoiceArray.append(z.choice!)
////                                        }
//                                    }
////                                    print(questionElementArray)
//                                }
//                            }
//                        }
//                        questionnaire = x.data.questionnaire
//                        for al in x.data.questionnaire{
//                            ScreenNumberArray.append(al.screenNo ?? "")
//                        }
//                        print(ScreenNumberArray)
//                    case .failure(let er):
//                        print(er)
//                    }
//                }
//
//            })
//        })
//        
//        
//    }
//    
//    
//    
//}
//
//struct SurveyOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        
////        let coredm = SurveyCDManager.Shared
////        let question = SurveyQuestion(context: coredm.PersistentContainer.viewContext)
//        
//        SurveyOptionView()
//    }
//}
//
///*
// ForEach(SurveyListVM.SurveyList,id:\.id){ i in
//     Questions(SurveyVM: SurveyViewModel(), SurveyListVM: SurveyListViewModel(), SelectedOptionByUser: $SelectedOptionByUser,Question: i.question, NumberOfOption: 4, option1: i.option01, option2: i.option02, option3: i.option03, option4: i.option04, selectedOption: i.selectedOption)
//
//     Button(action: {
////                        UpadateSelectedSurvey(surveyQuestion: i.Surveyquestion, selectedOptionByUser: SelectedOptionByUser)
//         
////                        i.selectedOption = SurveyVM.selectedOption
//         SurveyVM.selectedOption = i.selectedOption
//     }, label: {
//         Text("Sumbit")
//             .foregroundColor(.white)
//             .font(.title)
//             .frame(width: 150, height: 60, alignment: .center)
//             .background(Color.blue.cornerRadius(10))
//     })
// }
//
// Spacer()
// 
// Text("1/10")
//     .font(.title)
//     
//     .navigationTitle("Survey")
//     
//     .navigationBarItems(leading:
//                           NavigationLink(
//                             destination: addsurvey(ADDSurveyVM: AddSurveyLogic(), listVM: SurveyListViewModel(), VM: SurveyViewModel()),
//                             label: {
//                                 Text("Prev.")
//                             })
////                                            Button(action: {
////
////                        withAnimation(.easeInOut){
////                            questionNumber -= 1
////                        }
////                    }, label: {
////                        Text("Prev.")
////                    })
//         ,
//     
//     trailing: Button(action: {
//         withAnimation(.easeInOut(duration: 1)){
//             questionNumber += 1
//         }
//     }, label: {
//         Text("Next")
//     }))
//
// */
//
//struct Questions: View {
//    @StateObject var SurveyVM:SurveyViewModel
//    @StateObject var SurveyListVM:SurveyListViewModel
//    
//    
////    let surveyquestion:SurveyQuestion
//    
//    @Binding var SelectedOptionByUser:String
//
//
//    
//    let Question:String
//    let NumberOfOption:Int
//    let option1:String
//    let option2:String
//    let option3:String
//    let option4:String
//    var selectedOption:String
//    
//    var body: some View {
//        
//            VStack(spacing:60){
//                //Question:
//                Text(Question)
//                    .font(.system(size: 25))
//                
//                //Options:
//                VStack(alignment: .leading,spacing:20){
//                    
//                        Button(action: {
//                            SelectedOptionByUser = option1
//                        }, label: {
//                            Text(option1)
//                                .foregroundColor(.black)
//                                .frame(width: 250, height: 70, alignment: .center)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(SelcColor(option: option1), lineWidth: 5)
//                                )
//                        })
//                        
//                        Button(action: {
//                            SelectedOptionByUser = option2
//                        }, label: {
//                            Text(option2)
//                                .foregroundColor(.black)
//                                .frame(width: 250, height: 70, alignment: .center)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(SelcColor(option: option2), lineWidth: 5)
//                                )
//                        })
//                        
//                        Button(action: {
//                            SelectedOptionByUser = option3
//                        }, label: {
//                            Text(option3)
//                                .foregroundColor(.black)
//                                .frame(width: 250, height: 70, alignment: .center)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(SelcColor(option: option3), lineWidth: 5)
//                                )
//                        })
//                        
//                        Button(action: {
//                            SelectedOptionByUser = option4
//                        }, label: {
//                            Text(option4)
//                                .foregroundColor(.black)
//                                .frame(width: 250, height: 70, alignment: .center)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(SelcColor(option: option4), lineWidth: 5)
//                                )
//                        })
//                    
//                }.font(.system(size: 20))
//                
//                
//            }
//            .frame(width: 330, height: 610, alignment: .center)
//            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
//            .onAppear(perform: {
//                SurveyListVM.GetSurveyQuestion()
//            })
//
//        
//            }
//    func SelcColor(option:String)-> Color{
//        if option == SelectedOptionByUser{
//            return Color.blue
//        }
//        else{
//            return Color.black
//        }
//    }
//}
//
////    @State var SelectedOption:String = ""
////    @State var questionNumber:Int = 1
////    @StateObject var SurveyListVM:SurveyListViewModel
////    @State var SelectedOptionByUser:String = ""
////    @StateObject var SurveyVM:SurveyViewModel
//    
////    func UpadateSelectedSurvey(surveyQuestion:SurveyQuestion,selectedOptionByUser:String){
////        var survey = [surveyQuestion]
////        survey = SurveyCDManager.Shared.GetSurvey()
////
////        print(survey.first!.question!)
//////        print(survey[1].question!)
////        survey[0].selectedOption = "B"
//////        print(survey[0].selectedOption!)
////        SurveyCDManager.Shared.Save()
////    }
