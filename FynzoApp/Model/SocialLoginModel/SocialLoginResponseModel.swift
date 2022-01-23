//
//  SocialLoginResponseModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import Foundation

//SocialLoginResponseModel

/*
 {
     "status": true,
     "msg": "social signin successfully",
     "data": {
         "id": "28851",
         "base_user_id": "83931",
         "first_name": "Harsh",
         "last_name": "Kumar",
         "image": "uploads/profile/",
         "email": "user7@gmail.com",
         "phone": "8882831669",
         "password": "cc912520037f717b57b335cc7fe83522",
         "country_code": "IND",
         "hybridauth_provider_name": null,
         "hybridauth_provider_uid": null,
         "company_name": "abcd",
         "kiosk_pin": "0",
         "is_verified": "1",
         "requested_plan_id": "0",
         "status": "0",
         "createTime": "2021-09-15 22:23:08",
         "updateTime": "2021-09-15 22:23:08",
         "signup": false,
         "active_plan": {
             "id": "1",
             "name": "Basic",
             "type": "0",
             "no_of_devices": "1",
             "price_per_month": "0",
             "no_of_months": "0",
             "plan_startTime": "2021-09-15 22:23:08",
             "plan_endTime": "2021-09-30 22:23:08"
         },
         "is_new_user": false,
         "first_ask": {
             "phone": false,
             "company": false
         }
     }
 }
 */

struct SocialLoginResponseModel: Codable {
    var status: Bool
    var msg: String
    var data: DataClasses

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClasses: Codable {
    var id: String
    var baseUserID: String
    var firstName: String
    var lastName: String
    var image: String
    var email: String
    var phone: String
    var password: String
    var countryCode: String
//    var hybridauthProviderName: JSONNull?
//    var hybridauthProviderUid: JSONNull?
    var companyName: String
    var kioskPin: String
    var isVerified: String
    var requestedPlanID: String
    var status: String
    var createTime: String
    var updateTime: String
    var signup: Bool
    var activePlan: ActivePlans
    var isNewUser: Bool
    var firstAsk: FirstAsk

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case baseUserID = "base_user_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case image = "image"
        case email = "email"
        case phone = "phone"
        case password = "password"
        case countryCode = "country_code"
//        case hybridauthProviderName = "hybridauth_provider_name"
//        case hybridauthProviderUid = "hybridauth_provider_uid"
        case companyName = "company_name"
        case kioskPin = "kiosk_pin"
        case isVerified = "is_verified"
        case requestedPlanID = "requested_plan_id"
        case status = "status"
        case createTime = "createTime"
        case updateTime = "updateTime"
        case signup = "signup"
        case activePlan = "active_plan"
        case isNewUser = "is_new_user"
        case firstAsk = "first_ask"
    }
}

// MARK: - ActivePlan
struct ActivePlans: Codable {
    var id: String
    var name: String
    var type: String
    var noOfDevices: String
    var pricePerMonth: String
    var noOfMonths: String
    var planStartTime: String
    var planEndTime: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case noOfDevices = "no_of_devices"
        case pricePerMonth = "price_per_month"
        case noOfMonths = "no_of_months"
        case planStartTime = "plan_startTime"
        case planEndTime = "plan_endTime"
    }
}

// MARK: - FirstAsk
struct FirstAsk: Codable {
    var phone: Bool
    var company: Bool

    enum CodingKeys: String, CodingKey {
        case phone = "phone"
        case company = "company"
    }
}

// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        // No-op
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
