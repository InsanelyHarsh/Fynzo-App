////
////  <<addsurvey>>.swift
////  FynzoApp
////
////  Created by Harsh Yadav on 24/09/21.
////
//
//import SwiftUI
//
//struct addsurvey: View {
//    @StateObject var ADDSurveyVM : AddSurveyLogic
//    @StateObject var listVM:SurveyListViewModel
//    @StateObject var VM:SurveyViewModel
//    
//    var fetchedDatas = [SurveyQuestion]()
//    
//    func UpdateSelectedOption(){
//        let fetchedData = SurveyCDManager.Shared.GetSurvey()
//        
//        //        self.fetchedData = fetchedData
//        
//        let firstUser = fetchedData.first!
//        
//        //        firstUser.option01! += " the first option"
//        //        SurveyCDManager.Shared.Save()
//        print(firstUser.question!)
//        //        print(firstUser.option01 ?? "")
//        //        print(firstUser.option02!)
//        //        print(firstUser.option03!)
//        //        print(firstUser.option04!)
//    }
//    
//    var body: some View {
//        VStack{
//            VStack{
//                
//                ForEach(listVM.SurveyList, id:\.id){i in
//                    Text(i.question)
//                    Text(i.option01)
//                    Text(i.option02)
//                    Text(i.option03)
//                    Text(i.option04)
//                    Button(action: {
//                        
//                        VM.Del(input: i.Surveyquestion)
//                        
//                    }, label: {
//                        Text("Delete")
//                            .foregroundColor(.red)
//                    })
//                }
//            }
//            
//            
//            VStack(alignment: .leading){
//                Text("Question")
//                    .padding()
//                
//                TextField("", text: $ADDSurveyVM.question)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .background(Color.gray)
//                
//            }
//            
//            VStack(alignment: .leading){
//                Text("Option 01")
//                TextField("", text: $ADDSurveyVM.option01)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .background(Color.gray)
//                
//            }
//            VStack(alignment: .leading){
//                Text("Option 02")
//                TextField("", text: $ADDSurveyVM.option02)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .background(Color.gray)
//                
//            }
//            VStack(alignment: .leading){
//                Text("Option 03")
//                TextField("", text: $ADDSurveyVM.option03)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .background(Color.gray)
//                
//            }
//            VStack(alignment: .leading){
//                Text("Option 04")
//                TextField("", text: $ADDSurveyVM.option04)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .background(Color.gray)
//                
//            }
//            
//            Button(action: {
//                ADDSurveyVM.AddNewSurvey()
//            }, label: {
//                Text("Sumbit")
//            })
//            
//            Spacer()
//            
//            
//        }.onAppear(perform: {
//            listVM.GetSurveyQuestion()
//        })
//    }
//}
//
//struct addsurvey_Previews: PreviewProvider {
//    static var previews: some View {
//        addsurvey(ADDSurveyVM: AddSurveyLogic(), listVM: SurveyListViewModel(), VM: SurveyViewModel())
//    }
//}
