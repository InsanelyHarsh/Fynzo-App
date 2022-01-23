//
//  SurveyLogic.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 23/11/21.
//

import Foundation
import SwiftUI
//MARK: Extracted Views

class SurveyViewLogic{
    @ViewBuilder
    func SurveyViews(questionTypeID:questionTypeID.RawValue,
                     isNps:String,
                     shape:String,
                     statement:String,
                     ChoiceArray:[QuestionElement],
                     isTextBox:String,
                     scale:String,
                     labels:String,
                     questionID:String,
                     index:Int,
                     Rating:[Model])-> some View
    {
        ForEach(Rating.indices){ index in
            
            if (questionTypeID == "0") && (Rating[index].questionID == questionID){
                SurveyStatement(Statement: statement)
            }
            if (questionTypeID == "1") && (Rating[index].questionID == questionID){
                if isTextBox == "1"{
                    LongTextView(UserText: "")
                }
                if isTextBox == "0"{
                    StatementView(Entry: "", EntryTitle: statement)
                }
            }
            
            if (questionTypeID == "2") && (Rating[index].questionID == questionID){
                CheckListView(CheckListTitle: statement, CheckListOptionArray: ChoiceArray, questionId: questionID)
            }
            if (questionTypeID == "3") && (Rating[index].questionID == questionID){
                RadioButtonView(RadioButtonTittle: statement, RadioButtonChoiceArray: ChoiceArray)
            }
            if (questionTypeID == "4") && (Rating[index].questionID == questionID){
                DropDownView(DropDownTitle: statement, OptionsArray: ChoiceArray)
            }
            if (questionTypeID == "5") && (Rating[index].questionID == questionID){
                if (isNps == "0") && (shape == "0"){
                    RatingView(Rating:0, ratingQuestion: statement,NumberofStars: scale, Label: labels,i:index)
                }
                if (isNps == "1") && (shape == "0"){
                    ScaleView(Index: 4, ScaleStatement: statement,NumberofStars: scale, Label: labels)
                }
                if (isNps == "0") && (shape == "1"){
                    SmileyFaceView(QuestionText: statement, Label: labels)
                }
            }
                    if (questionTypeID == "6") && (Rating[index].questionID == questionID){
                        VStack{
                            SurveyStatement(Statement: statement)
                            Text("CommingSoon")
                            Text("Question Type ID ==> \(questionTypeID)")
                        }
                    }
                    if (questionTypeID == "7") && (Rating[index].questionID == questionID){
                        VStack{
                            SurveyStatement(Statement: statement)
                            Text("CommingSoon")
                            Text("Question Type ID ==> \(questionTypeID)")
                        }                }
                    if (questionTypeID == "8") && (Rating[index].questionID == questionID){
                        VStack{
                            SurveyStatement(Statement: statement)
                            Text("CommingSoon")
                            Text("Question Type ID ==> \(questionTypeID)")
                        }
                    }
        }
    }
}
