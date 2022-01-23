//
//  SettingListView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 15/09/21.
//

import SwiftUI

struct SettingRowView: View {
    let title:String
    let info:String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(info)
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(title: "dasf", info: "sadfaos")
    }
}
