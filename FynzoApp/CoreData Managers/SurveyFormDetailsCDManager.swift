//
//  SurveyFormDetailsCDManager.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 28/09/21.
//

import Foundation
import CoreData
class SurveyFormDetailsCDManager{
    let PersistentContainer : NSPersistentContainer
    static let Shared = SurveyFormDetailsCDManager()
    
    private init(){
        PersistentContainer = NSPersistentContainer(name: "CDSurveyFormDetails")
        PersistentContainer.loadPersistentStores { description, error in
            if error != nil{
                print("<<< Unable to Init >>>")
                print("\(error.debugDescription)")
            }
        }
    }
    
    func SaveSurveyFormDetails(){
        do{
            try PersistentContainer.viewContext.save()
            print("<<< Saved >>>")
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
//    func GetAllSurveyFormDetails()->[SurveyDetails]{
//        let FetchRequest:NSFetchRequest<SurveyDetails> = SurveyDetails.fetchRequest()
//
//        do{
//            print("<<< Fetching Successfully >>>")
//
//            return try PersistentContainer.viewContext.fetch(FetchRequest)
//        }
//        catch{
//            print("<<< Failed to fetch surveyForm Listings >>>")
//            return []
//        }
//    }
    
//    func GetDataByID(id:NSManagedObjectID) -> Questionnaire?{
//        do{
//            return try PersistentContainer.viewContext.existingObject(with: id) as? Questionnaire
//        }
//        catch{
//            return nil
//        }
//    }
//
//    func DelQuestion(input:Questionnaire){
//        PersistentContainer.viewContext.delete(input)
//        do{
//            try PersistentContainer.viewContext.save()
//        }
//        catch{
//            PersistentContainer.viewContext.rollback()
//        }
//    }
}
