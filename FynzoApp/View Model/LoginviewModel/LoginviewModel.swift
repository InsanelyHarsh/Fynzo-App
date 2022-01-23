//
//  LoginviewModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import Foundation
import CoreData

class LoginViewModel:ObservableObject{
    //Data Entered by User (Email and Password)
    @Published var LoginEmail:String = ""
    @Published var LoginPass:String = ""
    
    @Published var UserStatus:Bool = false
    @Published var isFetchingLoginDetails:Bool = false
    
    

    func getData(){
        Networking().LoginPostData(RequestURL: "https://accounts.fynzo.com/webservices/login",UserLoginEmailInput: LoginEmail,UserLoginPasswordInput: LoginPass)
        { (result:Result<APIResponse,Networking.POSTNetworkError>) in
            switch result{
            case .success(let finalData):
                DispatchQueue.main.async {

                    self.UserStatus = finalData.status
                    
                    if finalData.status{
                        //saving data to CoreData
                        
                        let manager = CoreDataManager02.Shared
                        
                        let userLoginData = UserLoginDetails(context: manager.PersistentContainer.viewContext)

                        userLoginData.firstName = finalData.data.firstName
                        userLoginData.lastName = finalData.data.lastName
                        userLoginData.emailAdd = finalData.data.email
                        userLoginData.status = finalData.status
                        userLoginData.planName = finalData.data.activePlan.name
                        userLoginData.planStartTime = finalData.data.activePlan.planStartTime
                        userLoginData.planEndTime = finalData.data.activePlan.planEndTime
//                        userLoginData.companyName = finalData.data.companyName
                        userLoginData.countryCode = finalData.data.countryCode
                        userLoginData.msg = finalData.msg

                        
                        //iD used for calling SurveyForms Listing
                        
                        userLoginData.iD = finalData.data.id
//                        print(finalData.data.id)
                        
                        SurveyFormListingsViewModel().SurveyFormListing(UserID: Int(finalData.data.id)!)
//                        SurveyFormlistingVM().SurveyFormListing(UserID: Int(finalData.data.id)!)
                        
                        manager.SAVE()
                        
                        
                        self.isFetchingLoginDetails = false
                    }
                    
                    if !finalData.status{
                        self.UserStatus = false
                        print("wrong pass/userName")
                    }

                }

            case .failure(let err):
                self.UserStatus = false
                print("There is an error in fetching User Login Details: \(err). Localized Description: \(err.localizedDescription)")
            }
        }
    }
}




class UserLoginDataViewModel:ObservableObject{
    @Published var userlogindetails = [UserLoginViewModel]()
    
    func GetALLData(){
        let fetchedData = CoreDataManager02.Shared.GetUserLoginData()
        DispatchQueue.main.async {
            self.userlogindetails = fetchedData.map(UserLoginViewModel.init)
            print("COMPLETED Fetching Login Data :)")
        }
    }
    
    func DeleteybyID(input:UserLoginViewModel){
        let x = CoreDataManager02.Shared.GetDataByID(id: input.id)
        if let x = x{
            CoreDataManager02.Shared.DelData(input: x)
        }
    }

}



struct UserLoginViewModel{
    let userlogindata:UserLoginDetails
    
    
    var SurveyFormListingID:String{
        return userlogindata.iD ?? ""
    }
    
    var id:NSManagedObjectID{
        return userlogindata.objectID
    }
    
    var msg:String{
        return userlogindata.msg ?? ""
    }
    
    var firstName:String{
        return userlogindata.firstName ?? "fetching first name"
    }
    
    var lastName:String{
        return userlogindata.lastName ?? "fetching last name"
    }
    
    var Email:String{
        return userlogindata.emailAdd ?? "EMA"
    }
    
    var Status:Bool{
        return userlogindata.status
    }
    
    var planName:String{
        return userlogindata.planName ?? "--"
    }
    
    var planStartTime:String{
        return userlogindata.planStartTime ?? "--"
    }
    
    var planEndTime:String{
        return userlogindata.planEndTime ?? "--"
    }
    
    var companyName:String{
        return userlogindata.companyName ?? "--"
    }
    
    var countryCode:String{
        return userlogindata.countryCode ?? "--"
    }
}
