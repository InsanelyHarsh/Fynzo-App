//
//  SurveyListModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 24/09/21.
//

import Foundation
import CoreData

//class SurveyListViewModel:ObservableObject{
//    @Published var SurveyList = [SurveyDataViewModel]()
//    var fetchedData = [SurveyQuestion]()
//    func GetSurveyQuestion(){
//        let fetchedData = SurveyCDManager.Shared.GetSurvey()
//        DispatchQueue.main.async {
//            self.SurveyList = fetchedData.map(SurveyDataViewModel.init)
//        }
//    }
//    
//    func UpdateSelectedOption(){
//        let fetchedData = SurveyCDManager.Shared.GetSurvey()
//        
//        self.fetchedData = fetchedData
//        
//        let firstUser = fetchedData.first!
//            
////        firstUser.option01! += " the first option"
////        SurveyCDManager.Shared.Save()
//        print(firstUser.question!)
//        print(firstUser.option01 ?? "")
//        print(firstUser.option02!)
//        print(firstUser.option03!)
//        print(firstUser.option04!)
//    }
//}


//struct SurveyDataViewModel{
//    let Surveyquestion:SurveyQuestion
//
//    var id:NSManagedObjectID{
//        return Surveyquestion.objectID
//    }
//
//    var question:String{
//        return Surveyquestion.question ?? "-"
//    }
//
//    var option01:String{
//        return Surveyquestion.option01 ?? "-"
//    }
//
//    var option02:String{
//        return Surveyquestion.option02 ?? ""
//    }
//
//    var option03:String{
//        return Surveyquestion.option03 ?? ""
//    }
//
//    var option04:String{
//        return Surveyquestion.option04 ?? ""
//    }
//
//    var selectedOption:String{
//        return Surveyquestion.selectedOption ?? ""
//    }
//}
