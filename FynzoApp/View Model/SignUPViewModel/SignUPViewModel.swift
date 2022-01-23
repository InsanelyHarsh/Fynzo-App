//
//  SignUPViewModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 17/09/21.
//

import Foundation
import CoreData

class SignUPViewModel:ObservableObject{
/// **Input Entered by User (Text Field ) :-**
    
    @Published var NewUserName:String = ""
    @Published var NewUserEmail:String = ""
    @Published var NewUserPassword:String = ""
    @Published var NewUserMobileNumber:String = ""
    @Published var NewUserCompany:String = ""
    
    @Published var MsgForUser:String = ""
    @Published var ShowMsg:Bool = false
    
    func GetNewUserResponse(){
        
        Networking().SignUPPost(RequestURL: "https://accounts.fynzo.com/webservices/register", NewUserName: NewUserName, NewUserEmail: NewUserEmail, NewUserPassword: NewUserPassword, NewUserMobileNumber: NewUserMobileNumber, NewUserCompany: NewUserCompany) { (result:Result<SignUPTestResponseModel,Networking.POSTNetworkError>) in
            
            
            switch result{
            
            case .success(let final):
                
                if final.status{
                    print("registered :)))))))))))))))))))))")
                    self.NewUser()
                }
                
                if final.msg == "This email is already registerd with Fynzo"{
                    DispatchQueue.main.async {
                        self.MsgForUser = "Already Registerd"
                        self.ShowMsg = true
                    }
                    print("Already Registerd")
                }
                
            case .failure(let err):
                print(err)
            }
        }
        
        
    }
    
    func NewUser(){
        Networking().SignUPPost(RequestURL: "https://accounts.fynzo.com/webservices/register", NewUserName: self.NewUserName, NewUserEmail: self.NewUserEmail, NewUserPassword: self.NewUserPassword, NewUserMobileNumber: self.NewUserMobileNumber, NewUserCompany: self.NewUserCompany)
        { (result:Result<SignUPSuccessResponseModel,Networking.POSTNetworkError>) in
            switch result{
            case .success(let finalData):
                if finalData.status{
                    DispatchQueue.main.async {
                        self.MsgForUser = "Signed UP Successfully"
                        self.ShowMsg = true
                    }
                    print("Signed UP Successfully")
                    let manager = CoreDataManager02.Shared
                    let UserSignUPData = UserLoginDetails(context: manager.PersistentContainer.viewContext)
                    
                    UserSignUPData.firstName = finalData.data.firstName
                    UserSignUPData.lastName = finalData.data.lastName
                    UserSignUPData.emailAdd = finalData.data.email
                    UserSignUPData.status = finalData.status
                    UserSignUPData.planName = finalData.data.activePlan.name
                    UserSignUPData.planStartTime = finalData.data.activePlan.planStartTime
                    UserSignUPData.planEndTime = finalData.data.activePlan.planEndTime
                    UserSignUPData.companyName = finalData.data.companyName
                    UserSignUPData.countryCode = finalData.data.countryCode
                    UserSignUPData.msg = finalData.msg
                    
                    manager.SAVE()
                }
                
                print("saved Successfully")
            case .failure(let err):
                print(err)
            }
        }
    }
}

struct ViewModel{
    let userlogindata:UserLoginDetails
    

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
