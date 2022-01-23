//
//  HomeView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

//struct HomeView: View {
//    @State var showSurvey:Bool = false
//    @StateObject var VM:SurveyFormListingsViewModel
//
//    var body: some View {
//        VStack(spacing:35){
//            ForEach(VM.SurveyListingData , id:\.id){ i in
//                FeedBackView(SurveyTitle: i.name, VM: SurveyFormListingsViewModel())
//                Text(i.name)
//            }
//
//
//            Text("Hello")
//
//        }.onAppear(perform: {
//            SurveyFormListingsViewModel().GetAllSurveyFormListing()
//        })
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(VM: SurveyFormListingsViewModel())
//    }
//}
