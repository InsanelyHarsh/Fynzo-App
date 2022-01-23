//
//  SurveyCDManager.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 22/09/21.
//

import Foundation
import CoreData
//class SurveyCDManager{
//    static let Shared = SurveyCDManager()
//
//    let PersistentContainer : NSPersistentContainer
//    
//    private init(){
//
//        PersistentContainer = NSPersistentContainer(name: "CDSurvey")
//        
//        PersistentContainer.loadPersistentStores { description, error in
//            
//            if let error = error{
//                print("<<< Failed to Init CoreData(Survey) >>>")
//                print("<<<\(error.localizedDescription)>>>")
//            }
//        }
//    }
//    
//    
//    func Save(){
//        do{
//            try PersistentContainer.viewContext.save()
//            print("saved")
//        }
//        catch{
//            print("<<< Failed to Saved User Login Data >>>")
//            print("<<<\(error)>>>")
//        }
//    }
//    
//    
//    func GetSurvey() -> [SurveyQuestion]{
//        let fetchReqest: NSFetchRequest<SurveyQuestion> = SurveyQuestion.fetchRequest()
//        
//        do{
//            let fetchedData = try PersistentContainer.viewContext.fetch(fetchReqest)
//            print("<<< fetched Succ.(Survey)>>>")
//
//            return fetchedData
//        }
//        catch{
//            print("<<< Failed to Fetch >>>")
//            return []
//        }
//    }
//    
//    
//    func DelQuestion(input:SurveyQuestion){
//        PersistentContainer.viewContext.delete(input)
//        do{
//            try PersistentContainer.viewContext.save()
//        }
//        catch{
//            PersistentContainer.viewContext.rollback()
//        }
//    }
//    
//    func GetSurveyQuestionByID(id:NSManagedObjectID) -> SurveyQuestion?{
//        do{
//            return try PersistentContainer.viewContext.existingObject(with: id) as? SurveyQuestion
//        }
//        catch{
//            return nil
//        }
//    }
//    
//    func UpdateSurvey(){
//        do{
//            try PersistentContainer.viewContext.save()
//        }
//        catch{
//            PersistentContainer.viewContext.rollback()
//        }
//    }
//
//    
//    
//    
//}
