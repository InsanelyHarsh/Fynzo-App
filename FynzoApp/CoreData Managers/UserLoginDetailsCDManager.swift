//
//  CoreDataManager.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 15/09/21.
//

import Foundation
import CoreData


class CoreDataManager02{
    let PersistentContainer : NSPersistentContainer
    static let Shared = CoreDataManager02()
    
    private init(){
        PersistentContainer = NSPersistentContainer(name: "CDUserLOGINDetails")
        PersistentContainer.loadPersistentStores { des, err in
            if let err = err{
                print("<<< Failed to Init CoreData >>>")
                print("<<<\(err.localizedDescription)>>>")
            }
        }
    }
    
    
    func SAVE(){
        do{
            try PersistentContainer.viewContext.save()
        }
        catch{
            print("<<< Failed to Saved User Login Data >>>")
            print("<<<\(error)>>>")
        }
    }
    
    
    func GetUserLoginData() -> [UserLoginDetails]{
        let fetchRequest : NSFetchRequest<UserLoginDetails> = UserLoginDetails.fetchRequest()
        do{
            let fetchedData = try PersistentContainer.viewContext.fetch(fetchRequest)
            print("<<< fetched Succ. >>>")
            return fetchedData
        }
        catch {
            print("<<< Failed to Fetch >>>")
            return []
        }
    }
    
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
