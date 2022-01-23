//
//  LoginResponseModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import Foundation


import Foundation

struct APIResponse: Decodable {
    let status: Bool
    let msg: String
    let data: DataClass
}

struct DataClass: Decodable {
    let id: String
    let baseUserID: String
    let firstName: String
    let lastName: String
    let image: String
    let email: String
    let phone: String
    let password: String
    let countryCode: String
//    let companyName: String
    let kioskPin: String
    let isVerified: String
    let requestedPlanID: String
    let status: String
    let createTime: String
    let updateTime: String
    let signup: Bool
    let activePlan: ActivePlan

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
//        case companyName = "company_name"
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

// MARK: - ActivePlan
struct ActivePlan: Decodable {
    let id: String
    let name: String
    let type: String
    let noOfDevices: String
    let pricePerMonth: String
    let noOfMonths: String
    let planStartTime: String
    let planEndTime: String

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

// MARK: - Encode/decode helpers

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
