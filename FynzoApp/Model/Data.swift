//
//  Data.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 08/09/21.
//

import Foundation
struct Data:Codable{
    let title:String
}
struct DataE:Encodable{
    let title:String
}



struct POSTDataTesting:Codable{
    let name:String
    let job:String
}


struct ResponseData: Decodable{
    let name: String
    let job: String
    let id: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case name
        case job
        case id
        case createdAt
    }
}

