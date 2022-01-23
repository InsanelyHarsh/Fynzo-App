//
//  GetData.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 08/09/21.
//

import Foundation


class Networking{
    ///  -----------------------------------------------------------------------------------------------------------------------------------------------------------
    
    ///    **Error Cases**
    enum NetworkError:Error{
        case badURL
        case DecodingError
        case UnknownError
    }
    ///    **GET JSON CALSS**
    func getJSonPlaceHoldTitle(completion: @escaping (Result<[Data],NetworkError>) -> Void){
        let string = "https://jsonplaceholder.typicode.com/posts"
        getJSON(urlString: string, completion: completion)
    }
    
    
    
    ///    ** Main LOGIC**
    func getJSON<T:Decodable>(urlString:String, completion: @escaping (Result<T,NetworkError>)-> () ){
        ///    * Unwraping URL*
        guard let url = URL(string: urlString) else{
            print("<<< BAD URL >>>")
            completion(.failure(.badURL))
            return
        }
        
        ///    * DECODING*
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil , let data = data else {
                completion(.failure(.UnknownError))
                return
            }
            
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode(T.self, from: data)
            
            if decodedData == nil{
                completion(.failure(.DecodingError))
            }
            if let decodedData = decodedData{                   //or we can force unwrap it also
                completion(.success(decodedData))
            }
        }.resume()
    }
    
    
    ///-----------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    
    enum POSTNetworkError:Error{
        case badURL
        case DecodingError
        case UnknownError
        case EncodingError
    }
    
    func LoginPostData<T:Decodable>(RequestURL:String,UserLoginEmailInput:String,UserLoginPasswordInput:String, completion: @escaping (Result<T,POSTNetworkError>)-> ())
    {
        
        //UserName & Password Entered by user:
        let username = "admin"
        let password = "1234"
        
        

        //URL Logic (encoding auth and other logic):
        let loginString = "\(username):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            completion(.failure(.UnknownError))
            return
        }
        print("<<< Checking URL >>>")
        let base64LoginString = loginData.base64EncodedString()
        guard let url = URL(string: RequestURL)
        else{
            print("<<< BAD URL >>>")
            completion(.failure(.badURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "post"
        
//TODO:
        let LoginRequest = LoginPostModel(service: "feedback", email: UserLoginEmailInput, password: UserLoginPasswordInput, device_id: "dscwedcwedc", visitor_tracking: VisitorTracking(utm_source: "", utm_medium: "", utm_campaign: "", utm_term: "", utm_content: "", gclid: ""))
        
        print("<<< Sending Request >>>")
        
        //Encoding:
        do {
            let requestBody = try JSONEncoder().encode(LoginRequest)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            print("<<< Encoding Completed Successfully >>> :)")
        } catch let error {
            completion(.failure(.UnknownError))
            debugPrint(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            guard let data = data else{
                completion(.failure(.UnknownError))
                print(error?.localizedDescription ?? "error")
                return
            }
//           print(String(data: data, encoding: .utf8)!)
            print("<<< Starting Decoding >>>")
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
//                print(response.msg)
                print("<<< Decoded Successfully >>> :)")
            }
            catch{
                completion(.failure(.DecodingError))
                print("<<< Decoding Failed >>> :( -->  \(error.localizedDescription) \(error)")
            }
        }.resume()
        
    }
    
    
    
    func SocailLoginPostData<T:Decodable>(RequestURL:String,UserSocialLoginName:String,UserSocialLoginEmail:String, completion: @escaping (Result<T,POSTNetworkError>)-> ())
    {
        
        //UserName & Password Entered by user:
        let username = "admin"
        let password = "1234"
        
        

        //URL Logic (encoding auth and other logic):
        let loginString = "\(username):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            completion(.failure(.UnknownError))
            return
        }
        print("<<< Checking URL >>>")
        let base64LoginString = loginData.base64EncodedString()
        guard let url = URL(string: RequestURL)
        else{
            print("<<< BAD URL >>>")
            completion(.failure(.badURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "post"
        
        

        let SocialLoginRequest = SocialLoginPostModel(profile: Profile(firstName: UserSocialLoginName, email: UserSocialLoginEmail), visitorTracking: VisitorTrackings())
        
        print("<<< Sending Request >>>")
        
        //Encoding:
        do {
            let requestBody = try JSONEncoder().encode(SocialLoginRequest)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            print("<<< Encoding Completed Successfully >>> :)")
        } catch let error {
            completion(.failure(.UnknownError))
            debugPrint(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            guard let data = data else{
                completion(.failure(.UnknownError))
                print(error?.localizedDescription ?? "error")
                return
            }
//           print(String(data: data, encoding: .utf8)!)
            print("<<< Starting Decoding >>>")
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
//                print(response.msg)
                print("<<< Decoded Successfully >>> :)")
            }
            catch{
                completion(.failure(.DecodingError))
                print("<<< Decoding Failed >>> :( -->  \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
    
    func SignUPPost<T:Decodable>(RequestURL:String,NewUserName:String,NewUserEmail:String,NewUserPassword:String,NewUserMobileNumber:String,NewUserCompany:String, completion: @escaping (Result<T,POSTNetworkError>)-> ())
    {
        
        //UserName & Password Entered by user:
        let username = "admin"
        let password = "1234"
        
        
        //URL Logic (encoding auth and other logic):
        let loginString = "\(username):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            completion(.failure(.UnknownError))
            return
        }
        
        print("<<< Checking URL >>>")
        
        let base64LoginString = loginData.base64EncodedString()
        
        guard let url = URL(string: RequestURL)
        else{
            print("<<< BAD URL >>>")
            completion(.failure(.badURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "post"
        
        let SignUPRequest = SignUpPostModel(service: "feedback", firstName: NewUserName, phone: NewUserMobileNumber, email: NewUserEmail, password: NewUserPassword, companyName: NewUserCompany, countrycode: "IND", deviceID: "dscwedcwedc", visitorTracking: VistorTrack(utmSource: "", utmMedium: "", utmCampaign: "", utmTerm: "", utmContent: "", gclid: ""))
        
        print("<<< Sending Request >>>")

        
        //Encoding:
        do {
//            let requestBody = try JSONEncoder().encode(SignUpPostModel)
            let requestBody = try JSONEncoder().encode(SignUPRequest)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            print("<<< Encoding Completed Successfully >>> :)")
        } catch let error {
            completion(.failure(.UnknownError))
            debugPrint(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            guard let data = data else{
                completion(.failure(.UnknownError))
                print(error?.localizedDescription ?? "error")
                return
            }
//           print(String(data: data, encoding: .utf8)!)
            print("<<< Starting Decoding >>>")
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
//                print(response.msg)
                print("<<< Decoded Successfully >>> :)")
            }
            catch{
                completion(.failure(.DecodingError))
                print("<<< Decoding Failed >>> :( -->  \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    
}
