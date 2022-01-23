//
//  SocialLoginViewModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 16/09/21.
//

import Foundation
class SocialLoginViewModel:ObservableObject{
    @Published var UserInputFirstName:String = ""
    @Published var UserInputEmail:String = ""
    
    @Published var UserLoginStatus:Bool = false
    
    func GetDataSocialLogin(){
        
        Networking().SocailLoginPostData(RequestURL: "https://accounts.fynzo.com/webservices/sociallogin", UserSocialLoginName: "Harsh Kumar", UserSocialLoginEmail: "user7@gmail.com", completion: { (result:Result<SocialLoginResponseModel,Networking.POSTNetworkError>) in
            switch result{
            case .success(let FinalResponse):
                self.UserLoginStatus = FinalResponse.status
                print(FinalResponse)
                print(FinalResponse.data.id)
            case .failure(let error):
                print(error)
            }
        }
    )}
    
    
    
}

