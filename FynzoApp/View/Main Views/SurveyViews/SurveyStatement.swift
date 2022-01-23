//
//  SurveyStatement.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 30/09/21.
//

import SwiftUI

struct SurveyStatement: View {
    @State var Statement:String
//    @Environment(\.dynamicTypeSize) var d
    var body: some View {

        VStack{
            Text("\(Statement)")
        }
    }
}

//struct SurveyStatement_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyStatement(Statement: "How was the Food?")
//
//    }
//}
