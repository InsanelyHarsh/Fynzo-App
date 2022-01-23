//
//  ResponseSuveyFormDetailModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import Foundation




//-------------------------------



//------------------------------------------
struct ResponseSuveyFormDetailModel_Array: Decodable {
    var status: Bool
    var msg: String
    var data: DataClas_Array

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClas_Array: Decodable {
    var surveyform: Surveyform_Array
    var questionnaire: [Questionnaire_Array]
    
    enum CodingKeys: String, CodingKey {
        case surveyform = "surveyform"
        case questionnaire = "questionnaire"
    }
}

// MARK: - Questionnaire
struct Questionnaire_Array: Decodable {
    var id: String
    var surveyFormID: String
    var screenNo: String
    var questionNo: String
    var questionText: String
    var isCompulsory: String
    var questionTypeID: String
    var groupingParentQqid: String
    var clubbingParentQqid: String
    var copiedFrom: String
    var status: String
    var createTime: String
    var updateTime: String
    var question: [QuestionArray]
    var dquestion: [Dquestion]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case surveyFormID = "survey_form_id"
        case screenNo = "screen_no"
        case questionNo = "question_no"
        case questionText = "question_text"
        case isCompulsory = "isCompulsory"
        case questionTypeID = "question_type_id"
        case groupingParentQqid = "grouping_parent_qqid"
        case clubbingParentQqid = "clubbing_parent_qqid"
        case copiedFrom = "copied_from"
        case status = "status"
        case createTime = "createTime"
        case updateTime = "updateTime"
        case question = "question"
        case dquestion = "dquestion"
    }
}

// MARK: - Dquestion
struct Dquestion: Decodable {
    var id: String?
    var answer: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case answer = "answer"
    }
}




//......array
struct QuestionArray: Decodable {
    var id: String?
    var questionnaireQuestionID: String?
    var choice: String?
    var status: String?
    var oldID: String?
    var createTime: String?
    var updateTime: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case questionnaireQuestionID = "questionnaire_question_id"
        case choice = "choice"
        case status = "status"
        case oldID = "old_id"
        case createTime = "createTime"
        case updateTime = "updateTime"
    }
}

// MARK: - Surveyform
struct Surveyform_Array: Codable {
    var id: String
    var uniqueKey: String
    var ownerID: String
    var name: String
    var surveyformDescription: String
    var logo: String
    var backgroundImage: String
    var saveLocation: String
    var onlySingleResponse: String
    var status: String
    var isTemplate: String
    var copiedFrom: String
    var createTime: String
    var updateTime: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case uniqueKey = "unique_key"
        case ownerID = "owner_id"
        case name = "name"
        case surveyformDescription = "description"
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
