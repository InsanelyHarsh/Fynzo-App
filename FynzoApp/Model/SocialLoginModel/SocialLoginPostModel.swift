//
//  SocialLoginPostModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import Foundation
/*
 {
     "provider_name": "Facebook",
     "provider_uid": "1213124412",
     "profile": {
         "first_name": "Nagendra2",
         "last_name": "",
         "phone": "",
         "email": "user2@gmail.com",
         "image": ""
     },
     "service": "feedback",
     "device_id": "dscwedcwedc",
     "visitor_tracking": {
         "utm_source": "",
         "utm_medium": "",
         "utm_campaign": "",
         "utm_term": "",
         "utm_content": "",
         "gclid": ""
     }
 }
 */
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SocialLoginPostModel: Codable {
    var providerName: String = "Facebook"
    var providerUid: String = "1213124412"
    var profile: Profile
    var service: String = "feedback"
    var deviceID: String = "dscwedcwedc"
    var visitorTracking: VisitorTrackings

    enum CodingKeys: String, CodingKey {
        case providerName = "provider_name"
        case providerUid = "provider_uid"
        case profile = "profile"
        case service = "service"
        case deviceID = "device_id"
        case visitorTracking = "visitor_tracking"
    }
}

// MARK: - Profile
struct Profile: Codable {
    var firstName: String
    var lastName: String = ""
    var phone: String = ""
    var email: String
    var image: String = ""

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case phone = "phone"
        case email = "email"
        case image = "image"
    }
}

// MARK: - VisitorTracking
struct VisitorTrackings: Codable {
    var utmSource: String = ""
    var utmMedium: String = ""
    var utmCampaign: String = ""
    var utmTerm: String = ""
    var utmContent: String = ""
    var gclid: String = ""

    enum CodingKeys: String, CodingKey {
        case utmSource = "utm_source"
        case utmMedium = "utm_medium"
        case utmCampaign = "utm_campaign"
        case utmTerm = "utm_term"
        case utmContent = "utm_content"
        case gclid = "gclid"
    }
}
