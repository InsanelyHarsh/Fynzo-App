//
//  TestingView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 02/10/21.
//

import SwiftUI

struct TestingView: View {
    @State var questionnaire:[Questionnaire] = []
    @State var dic:[String:[Questionnaire]] = [:]
    @State var dic01:[String:[String]] = [:]
    var body: some View {
        VStack {
            Text("Hello, World!")
//            .sorted(by: <)
            
//            let groupByCategory = Dictionary(grouping: deviceArray) { (device) -> String in
//                return device.category
//            }
            let s:[String] = dic01.values.flatMap{$0}
            ForEach(s, id:\.self){ i in
                Text(i)
            }
            
            let sd:[Questionnaire] = dic.values.flatMap{$0}
            ForEach(sd, id:\.id) { j in
                Text(j.questionText!)
                
            }
            
//            ForEach(dic.values, id: \.id) { value in
//                Text("\(value)")
//            }

        } .onAppear {
            Networking().GetSurveyFormDetails(RequestURL: "https://feedback.fynzo.com/webservices/surveyform", UserID: 29045, SurveyFormID: 11592) { (result:Result<ResponseSurveyFormDetailModel,Networking.POSTNetworkError>) in
                switch result{
                case .success(let finalData):
                    print(finalData)
                    
                    questionnaire = finalData.data.questionnaire
                    for i in questionnaire{
                        DispatchQueue.main.async {
                            dic01[i.id!] = ["dic01"]
                            dic[i.id!] = questionnaire
                        }
                    }
                    
                    
                    DispatchQueue.main.async {
                        let yy =  Dictionary(grouping: questionnaire) { (x)->String in
                            return x.id!
                        }
                        print(yy)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
