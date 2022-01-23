//
//  SettingsView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 07/09/21.
//

import SwiftUI

struct SettingsView: View {
    @State var openInLock:Bool = false
    @State var openinkiosk:Bool = false
    @State var UploadSettings:Bool = false
    @StateObject var UserLoginDataVM = UserLoginDataViewModel()
//    @StateObject var VM:SurveyFormListingsViewModel
    //    UserLoginDataViewModel
    
    
    var body: some View {
        VStack{
            List{
//                ForEach(VM.surveyFormListingData , id:\.id){ j in
                    ForEach(UserLoginDataVM.userlogindetails , id:\.id){i  in
                        Section(header: Text("Account")) {
                            SettingRowView(title: "Email", info: i.Email)
                        }
                        
                        Section(header: Text("Plan")) {
                            SettingRowView(title: "Name", info: i.planName)
                            SettingRowView(title: "start Date", info: i.planStartTime)
                            SettingRowView(title: "End Date", info: i.planEndTime)
                        }
                        
                        Section(header: Text("Default Phone Number Code")) {
                            SettingRowView(title: "Select Default Phone Number Code", info: i.countryCode)
                        }
                        
                        Section(header: Text("App")) {
                            SettingRowView(title: "Version", info: "1.0.0")
                        }
                        
                        Section(header: Text("Open In Lock")){
                            Toggle(isOn: $openInLock, label: {
                                Text("Open in Lock")
                            })
                        }
                        
                        Section(header: Text("Open In Koisk")){
                            Toggle(isOn: $openinkiosk, label: {
                                Text("Open in Koisk")
                            })
                        }
                        
                        Section(header: Text("Upload Setting")){
                            Toggle(isOn: $UploadSettings, label: {
                                Text("Auto Upload")
                            })
                        }
                        
                        Section(header: Text("Language")) {
                            HStack{
                                Text("Language")
                                Spacer()
                                Text("ToDO")
                            }
                        }
                    }
//                }
            }
        }
        .onAppear(perform: {
            UserLoginDataVM.GetALLData()
        })
        
        
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
