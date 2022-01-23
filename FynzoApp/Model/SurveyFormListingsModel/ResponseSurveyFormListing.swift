//
//  ResponseSurveyFormListing.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jSON = try? newJSONDecoder().decode(JSON.self, from: jsonData)

import Foundation

// MARK: - JSON
struct ResponseSurveyFormListingModel: Codable {
    var status: Bool?
    var msg: String?
    var data: [FormListingData]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}

// MARK: - Datum
struct FormListingData: Codable {
    var id: String?
    var uniqueKey: String?
    var ownerID: String?
    var name: String?
    var datumDescription: String?
    var storeName: JSONNull?
    var logo: String?
    var backgroundImage: String?
    var saveLocation: String?
    var onlySingleResponse: String?
    var status: String?
    var isTemplate: String?
    var copiedFrom: String?
    var createTime: String?
    var updateTime: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case uniqueKey = "unique_key"
        case ownerID = "owner_id"
        case name = "name"
        case datumDescription = "description"
        case storeName = "store_name"
        case logo = "logo"
        case backgroundImage = "background_image"
        case saveLocation = "saveLocation"
        case onlySingleResponse = "only_single_response"
        case status = "status"
        case isTemplate = "isTemplate"
        case copiedFrom = "copied_from"
        case createTime = "createTime"
        case updateTime = "updateTime"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
//--------------------------------
//struct ResponseSurveyFormListingModel: Decodable {
//    var status: Bool
//    var msg: String
//    var data: [FormListingData]
//
//    enum CodingKeys: String, CodingKey {
//        case status = "status"
//        case msg = "msg"
//        case data = "data"
//    }
//}

// MARK: - Datum
//struct FormListingData: Decodable {
//    var id: String
//    var uniqueKey: String
//    var ownerID: String
//    var name: String
//    var datumDescription: String
////    var storeName: JSONNull?
//    var logo: String
//    var backgroundImage: String
//    var saveLocation: String
//    var onlySingleResponse: String
//    var status: String
//    var isTemplate: String
//    var copiedFrom: String
//    var createTime: String
//    var updateTime: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case uniqueKey = "unique_key"
//        case ownerID = "owner_id"
//        case name = "name"
//        case datumDescription = "description"
////        case storeName = "store_name"
//        case logo = "logo"
//        case backgroundImage = "background_image"
//        case saveLocation = "saveLocation"
//        case onlySingleResponse = "only_single_response"
//        case status = "status"
//        case isTemplate = "isTemplate"
//        case copiedFrom = "copied_from"
//        case createTime = "createTime"
//        case updateTime = "updateTime"
//    }
//}
