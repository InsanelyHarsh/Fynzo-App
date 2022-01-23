//
//  SuveyFormListingCDManager.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 27/09/21.
//

import Foundation
import CoreData
/*
     func GetDataByID(id:NSManagedObjectID) -> UserLoginDetails?{
         do{
             return try PersistentContainer.viewContext.existingObject(with: id) as? UserLoginDetails
         }
         catch{
             return nil
         }
     }
     
     func DelData(input:UserLoginDetails){
         PersistentContainer.viewContext.delete(input)
         do{
             try PersistentContainer.viewContext.save()
         }
         catch{
             PersistentContainer.viewContext.rollback()
         }

     } 
 }
 */
class SurveyFormListingManager{
    let PersistentContainer : NSPersistentContainer
    static let Shared = SurveyFormListingManager()
    
    private init(){
        PersistentContainer = NSPersistentContainer(name: "CDSurveyFormListings")
        PersistentContainer.loadPersistentStores { description, error in
            if error != nil{
                print("<<< Unable to Init >>>")
                print("\(error.debugDescription)")
            }
        }
    }
    
    func SaveSurveyFormListing(){
        do{
            try PersistentContainer.viewContext.save()
            print("<<< Saved >>>")
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func GetAll()->[SuveyFormListingData]{
        let FetchRequest:NSFetchRequest<SuveyFormListingData> = SuveyFormListingData.fetchRequest()
        
        do{
            print("<<< Fetching Successfully >>>")

            return try PersistentContainer.viewContext.fetch(FetchRequest)
        }
        catch{
            print("<<< Failed to fetch surveyForm Listings >>>")
            return []
        }
    }
    
    func GetDataByID(id:NSManagedObjectID) -> SuveyFormListingData?{
        do{
            return try PersistentContainer.viewContext.existingObject(with: id) as? SuveyFormListingData
        }
        catch{
            return nil
        }
    }
    
    func DelQuestion(input:SuveyFormListingData){
        PersistentContainer.viewContext.delete(input)
        do{
            try PersistentContainer.viewContext.save()
        }
        catch{
            PersistentContainer.viewContext.rollback()
        }
    }
}
