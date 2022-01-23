//
//  response.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 28/09/21.
//
import Foundation

// MARK: - Welcome
struct ResponseSurveyFormDetailModel: Decodable {
    var status: Bool
    var msg: String
    var data: DataClas

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClas: Decodable {
    var surveyform: Surveyform
    var questionnaire: [Questionnaire]

    enum CodingKeys: String, CodingKey {
        case surveyform = "surveyform"
        case questionnaire = "questionnaire"
    }
}

// MARK: - Questionnaire
struct Questionnaire: Decodable {
//    var ID = UUID().uuidString
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
    var question: QuestionUnion?
    var dquestion: [Dquestions]

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
struct Dquestions: Codable {
    var id: String?
    var answer: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case answer = "answer"
    }
}

enum QuestionUnion: Codable,Hashable {
    
//    static func == (lhs: QuestionUnion, rhs: QuestionUnion) -> Bool {
//        return lhs == rhs
//    }
    
    case purpleQuestion(PurpleQuestion)
    case questionElementArray([QuestionElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([QuestionElement].self) {
            self = .questionElementArray(x)
            return
        }
        if let x = try? container.decode(PurpleQuestion.self) {
            self = .purpleQuestion(x)
            return
        }
        throw DecodingError.typeMismatch(QuestionUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for QuestionUnion"))
    }
}

// MARK: - QuestionElement
struct QuestionElement: Codable,Hashable{
    static func == (lhs: QuestionElement, rhs: QuestionElement) -> Bool {
        return lhs.id == rhs.id
        && lhs.questionnaireQuestionID == rhs.questionnaireQuestionID
        && lhs.choice == rhs.choice
        && lhs.status == rhs.status
        && lhs.oldID == rhs.oldID
        && lhs.createTime == rhs.createTime
        && lhs.updateTime == rhs.updateTime

    }
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

// MARK: - PurpleQuestion
struct PurpleQuestion: Codable,Hashable{
//    static func == (lhs: PurpleQuestion, rhs: PurpleQuestion) -> Bool {
//        return lhs.id == rhs.id
//        && lhs.isNps == rhs.isNps
//        && lhs.questionnaireQuestionID == rhs.questionnaireQuestionID
//        && lhs.status == rhs.status
//        && lhs.scale == rhs.scale
//        && lhs.shape == rhs.shape
//        && lhs.color == rhs.color
//        && lhs.labels == rhs.labels
//        && lhs.isTextbox == rhs.isTextbox
//        && lhs.responseCharactersLimit == rhs.responseCharactersLimit
//        && lhs.responseSmallLettersAllowed == rhs.responseSmallLettersAllowed
//        && lhs.responseCapitalLettersAllowed == rhs.responseCapitalLettersAllowed
//        && lhs.responseSpecialCharatersAllowed == rhs.responseSpecialCharatersAllowed
//        && lhs.responseNumbersAllowed == rhs.responseNumbersAllowed
//        && lhs.sendSMS == rhs.sendSMS
//        && lhs.useDate == rhs.useDate
//        && lhs.useTime == rhs.useTime
//        && lhs.viewFormatDate == rhs.viewFormatDate
//    }
    
    static func == (lhs: PurpleQuestion, rhs: PurpleQuestion) -> Bool {
        return lhs == rhs
    }
    
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
//    var responseRegexPattern: JSONNull?
    var sendSMS: String?
    var useDate: String?
    var useTime: String?
    var viewFormatDate: String?
    var viewFormatTime: String?
//    var minDate: JSONNull?
//    var maxDate: JSONNull?
    var minTime: String?
    var maxTime: String?
//    var minDatetime: JSONNull?
//    var maxDatetime: JSONNull?
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
//        case responseRegexPattern = "response_regex_pattern"
        case sendSMS = "send_sms"
        case useDate = "use_date"
        case useTime = "use_time"
        case viewFormatDate = "view_format_date"
        case viewFormatTime = "view_format_time"
//        case minDate = "min_date"
//        case maxDate = "max_date"
        case minTime = "min_time"
        case maxTime = "max_time"
//        case minDatetime = "min_datetime"
//        case maxDatetime = "max_datetime"
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

// MARK: - Surveyform
struct Surveyform: Codable {
    var id: String?
    var uniqueKey: String?
    var ownerID: String?
    var name: String?
    var surveyformDescription: String?
//    var storeName: JSONNull?
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
        case surveyformDescription = "description"
//        case storeName = "store_name"
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

//// MARK: - Encode/decode helpers
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
