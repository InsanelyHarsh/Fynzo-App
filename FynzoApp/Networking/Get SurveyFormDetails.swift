//
//  Get SurveyFormDetails.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 27/09/21.
//

import Foundation
extension Networking{
    func GetSurveyFormDetails<T:Decodable>(RequestURL:String,UserID:Int,SurveyFormID:Int, completion: @escaping (Result<T,POSTNetworkError>)-> ())
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
        
//---------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------

//Post Model
        let SurveyformDetailsRequest = PostSurveyFormDetailModel(surveyform_id: SurveyFormID, userid: UserID)       // make change here
        
        print("<<< Sending Request >>>")

        
        //Encoding:
        do {
            let requestBody = try JSONEncoder().encode(SurveyformDetailsRequest)        //make change here
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
            print("<<< Starting Decoding >>>")
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
                
                print("<<< Decoded Successfully >>> :)")
            }
            catch{
                completion(.failure(.DecodingError))
                print("<<< Decoding Failed >>> :( -->  \(error.localizedDescription)")
            }
        }.resume()
    }
}
