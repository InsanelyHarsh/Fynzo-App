//
//  surveyFormListingViewModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import Foundation
import CoreData



class SurveyFormListingsViewModel:ObservableObject{
    
    @Published var FINAL : [fuc] = []
    @Published var isLoading:Bool = true
    
    func SurveyFormListing(UserID:Int){
        
        Networking().GetSurveyFormsListing(RequestURL: "https://feedback.fynzo.com/webservices/surveyforms", UserID: UserID) { (result:Result<[ResponseSurveyFormListingModel],Networking.POSTNetworkError>) in
            switch result{
            case .success(let FinalResponse):
                
                DispatchQueue.main.async { [weak self] in
                    self?.FINAL = FinalResponse.map(fuc.init)
                    self?.isLoading = false
                }
                
            case .failure(let error):
                print("failed to Get SurveyForm Listings :(")
                print("Error \(error)")
            }
        }

    }
}


struct fuc{
    let SurveyForm:ResponseSurveyFormListingModel
    
    init(form:ResponseSurveyFormListingModel){
        self.SurveyForm = form
    }
    
    var SurveyFormID = UUID().uuidString
    
    var status:Bool{
        return SurveyForm.status ?? false
    }
    
    var MSG:String{
        return SurveyForm.msg ?? ""
    }
    
    var SurveyData:[FormListingData]{
        return SurveyForm.data ?? []
    }
    
   
}

//class SurveyFormlistingVM{
//    func SurveyFormListing(UserID:Int){
//        Networking().GetSurveyFormsListing(RequestURL: "https://feedback.fynzo.com/webservices/surveyforms", UserID: UserID) { (result:Result<ResponseSurveyFormListingModel,Networking.POSTNetworkError>) in
//            switch result{
//            case .success(let FinalResponse):
//
//                let manager = SurveyFormListingManager.Shared
//                let surveyFormListingData = SuveyFormListingData(context: manager.PersistentContainer.viewContext)
//
////                SurveyFormDetailsViewModel().GetSurveyFormDetails(UserID: Int(FinalResponse.data[0].ownerID)!, SurveyFormID: Int(FinalResponse.data[0].id)!)
//
////                FinalResponse.data is [] and we are looping through every survey/element of FinalResponse.data and saving it on coredata and
////                  with number of suvey
//
//                for i in FinalResponse.data {
//                    surveyFormListingData.name = i.name
//                    surveyFormListingData.owner_id = i.ownerID
//                    surveyFormListingData.suveyid = i.id
//                    surveyFormListingData.numberofSuvey = Int64(FinalResponse.data.count)
//                    print(i.name)
//                    print(i.ownerID)
//                    print(i.id)
//                    //UserID: 29045, SurveyFormID: 11592
//                    SurveyFormDetailsViewModel().GetSurveyFormDetails(UserID: 29045, SurveyFormID: 11592)
////                    SurveyFormDetailsViewModel().GetSurveyFormDetails(UserID: Int(FinalResponse.data[0].ownerID)!, SurveyFormID: Int(i.id)!)
//                }
//                print("<<< Saving survey Data >>>")
//                manager.SaveSurveyFormListing()
//
////                print(FinalResponse)
//                print(FinalResponse.data.count)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
//class SurveyFormListingsViewModel:ObservableObject{
//    @Published var surveyFormListingData = [SurveyFormListingData]()
//
//    func GetAllSurveyFormListing(){
//        let fetchedData = SurveyFormListingManager.Shared.GetAll()
//
//        DispatchQueue.main.async {
//
//            self.surveyFormListingData = fetchedData.map(SurveyFormListingData.init)
//
//            print("Number of Count: \(self.surveyFormListingData.count)")
//            print("Fetching of survey Form Listing is Completed")
//        }
//    }
//
//    func DeleteybyID(input:SurveyFormListingData){
//        let x = SurveyFormListingManager.Shared.GetDataByID(id: input.id)
//        if let x = x{
//            SurveyFormListingManager.Shared.DelQuestion(input: x)
//        }
//    }
//}



//struct SurveyFormListingData{
//    let survey:SuveyFormListingData
//
//    var id:NSManagedObjectID{
//        return survey.objectID
//    }
//
//    var name:String{
//        return survey.name ?? "<"
//    }
//
//    var ownerID:String{
//        return survey.owner_id ?? "<"
//    }
//
//    var surveyID:String{
//        return survey.suveyid ?? "<"
//    }
//
//    var NumberOFSurvey:Int{
//        return Int(survey.numberofSuvey)
//    }
//
//
//}
