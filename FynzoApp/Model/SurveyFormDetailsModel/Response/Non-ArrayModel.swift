//
//  Non-ArrayModel.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 28/09/21.
//

import Foundation

struct ResponseSuveyFormDetailModel_NonArray: Decodable {
    var status: Bool
    var msg: String
    var data: DataClas_NonArray

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}

struct DataClas_NonArray: Decodable {
    var surveyform: Surveyform_NonArray
    var questionnaire: [Questionnaire_NonArray]
    
    enum CodingKeys: String, CodingKey {
        case surveyform = "surveyform"
        case questionnaire = "questionnaire"
    }
}

struct Questionnaire_NonArray: Decodable {
    var id: String?
    var surveyFormID: String?
    var screenNo: String?
    var questionNo: String?
    var questionText: String?
    var isCompulsory: String?
    var questionTypeID: String?
    var groupingParentQqid: String?
    var clubbingParentQqid: String?
    var copiedFrom: String?
    var status: String?
    var createTime: String?
    var updateTime: String?
    var question: QuestionNonArray
    var dquestion: [Dquestion_NonArray]
    
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

struct Dquestion_NonArray: Decodable {
    var id: String?
    var answer: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case answer = "answer"
    }
}


//........object
struct QuestionNonArray: Codable {
    var id: String?
    var isNps: String?
    var questionnaireQuestionID: String?
    var scale: String?
    var shape: String?
    var color: String?
    var labels: String?
    var status: String?
    var createTime: String?
    var updateTime: String?
    var isTextbox: String?
    var responseCharactersLimit: String?
    var responseSmallLettersAllowed: String?
    var responseCapitalLettersAllowed: String?
    var responseSpecialCharatersAllowed: String?
    var responseNumbersAllowed: String?
    var sendSMS: String?
    var useDate: String?
    var useTime: String?
    var viewFormatDate: String?
    var viewFormatTime: String?
    var minTime: String?
    var maxTime: String?
    var subType: String?
    var instructions: String?
    var responseMinCount: String?
    var responseMaxCount: String?
    var responseExtensionsAllowed: String?
    var name: String?
    var nameCompulsory: String?
    var phone: String?
    var phoneCompulsory: String?
    var sendThankyouSMS: String?
    var email: String?
    var emailCompulsory: String?
    var sendThankyouEmail: String?
    var dateOfBirth: String?
    var dateOfBirthCompulsory: String?
    var dateOfAnniversary: String?
    var dateOfAnniversaryCompulsory: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isNps = "isNps"
        case questionnaireQuestionID = "questionnaire_question_id"
        case scale = "scale"
        case shape = "shape"
        case color = "color"
        case labels = "labels"
        case status = "status"
        case createTime = "createTime"
        case updateTime = "updateTime"
        case isTextbox = "isTextbox"
        case responseCharactersLimit = "response_characters_limit"
        case responseSmallLettersAllowed = "response_small_letters_allowed"
        case responseCapitalLettersAllowed = "response_capital_letters_allowed"
        case responseSpecialCharatersAllowed = "response_special_charaters_allowed"
        case responseNumbersAllowed = "response_numbers_allowed"
        case sendSMS = "send_sms"
        case useDate = "use_date"
        case useTime = "use_time"
        case viewFormatDate = "view_format_date"
        case viewFormatTime = "view_format_time"
        case minTime = "min_time"
        case maxTime = "max_time"
        case subType = "sub_type"
        case instructions = "instructions"
        case responseMinCount = "response_min_count"
        case responseMaxCount = "response_max_count"
        case responseExtensionsAllowed = "response_extensions_allowed"
        case name = "name"
        case nameCompulsory = "name_compulsory"
        case phone = "phone"
        case phoneCompulsory = "phone_compulsory"
        case sendThankyouSMS = "send_thankyou_sms"
        case email = "email"
        case emailCompulsory = "email_compulsory"
        case sendThankyouEmail = "send_thankyou_email"
        case dateOfBirth = "date_of_birth"
        case dateOfBirthCompulsory = "date_of_birth_compulsory"
        case dateOfAnniversary = "date_of_anniversary"
        case dateOfAnniversaryCompulsory = "date_of_anniversary_compulsory"
    }
}

struct Surveyform_NonArray: Codable {
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
