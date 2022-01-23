//
//  SignUPResponseModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 17/09/21.
//

import Foundation

struct SignUPTestResponseModel:Decodable{
    var status: Bool
    var msg: String
//    var data: [String] = []

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
//        case data = "data"
    }
}

//struct SignUPFailedResponseModel:Decodable{
//    var status: Bool
//    var msg: String
//    var data: [String] = []
//    
//    enum CodingKeys: String, CodingKey {
//        case status = "status"
//        case msg = "msg"
//        case data = "data"
//    }
//}

struct SignUPSuccessResponseModel: Codable {
    var status: Bool
    var msg: String
    var data: DataClassed

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}

struct DataClassed: Codable {
    var id: String
    var baseUserID: String
    var firstName: String
    var lastName: String
    var image: String
    var email: String
    var phone: String
    var password: String
    var countryCode: String
    var companyName: String
    var kioskPin: String
    var isVerified: String
    var requestedPlanID: String
    var status: String
    var createTime: String
    var updateTime: String
    var signup: Bool
    var activePlan: UserActivePlan

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
        case companyName = "company_name"
        case kioskPin = "kiosk_pin"
        case isVerified = "is_verified"
        case requestedPlanID = "requested_plan_id"
        case status = "status"
        case createTime = "createTime"
        case updateTime = "updateTime"
        case signup = "signup"
        case activePlan = "active_plan"
    }
}

struct UserActivePlan: Codable {
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

