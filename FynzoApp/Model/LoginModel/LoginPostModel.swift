//
//  LoginPostModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import Foundation
struct LoginPostModel: Codable {
    var service: String = "feedback"
    var email: String
    var password: String
    var device_id: String = "dscwedcwedc"
    var visitor_tracking: VisitorTracking


}

struct VisitorTracking: Codable {
    var utm_source: String = ""
    var utm_medium: String = ""
    var utm_campaign: String = ""
    var utm_term: String = ""
    var utm_content: String = ""
    var gclid: String = ""
}

//{
//    "service": "feedback",
//    "email": "user@gmail.com",
//    "password": "12345",
//    "device_id": "dscwedcwedc",
//    "visitor_tracking": {
//        "utm_source": "",
//        "utm_medium": "",
//        "utm_campaign": "",
//        "utm_term": "",
//        "utm_content": "",
//        "gclid": ""
//    }
//}
