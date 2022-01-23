//
//  CheckResponse.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 28/09/21.
//

import Foundation
struct ResponseSuveyFormDetailModel_Test:Decodable{
    var status: Bool
    var data: DataClas_T

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

struct DataClas_T: Decodable {
    var questionnaire: [Questionnaire_T]
    
    enum CodingKeys: String, CodingKey {
        case questionnaire = "questionnaire"
    }
}
struct Questionnaire_T: Decodable {

    var questionTypeID: String
    
    enum CodingKeys: String, CodingKey {
        case questionTypeID = "question_type_id"
    }
}
