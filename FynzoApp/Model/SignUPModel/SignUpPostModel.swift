//
//  SignUpPostModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 17/09/21.
//

import Foundation


struct SignUpPostModel:Encodable {
    var service: String
    var firstName: String
    var phone: String
    var email: String
    var password: String
    var companyName: String
    var countrycode: String
    var deviceID: String
    var visitorTracking: VistorTrack

    enum CodingKeys: String, CodingKey {
        case service = "service"
        case firstName = "first_name"
        case phone = "phone"
        case email = "email"
        case password = "password"
        case companyName = "company_name"
        case countrycode = "countrycode"
        case deviceID = "device_id"
        case visitorTracking = "visitor_tracking"
    }
}

struct VistorTrack:Encodable {
    var utmSource: String
    var utmMedium: String
    var utmCampaign: String
    var utmTerm: String
    var utmContent: String
    var gclid: String

    enum CodingKeys: String, CodingKey {
        case utmSource = "utm_source"
        case utmMedium = "utm_medium"
        case utmCampaign = "utm_campaign"
        case utmTerm = "utm_term"
        case utmContent = "utm_content"
        case gclid = "gclid"
    }
}
