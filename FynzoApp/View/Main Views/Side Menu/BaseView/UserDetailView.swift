//
//  UserDetailView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

struct UserDetailView: View {
    
    @StateObject var loginVm = LoginViewModel()
    let UserName:String
    let UserEmail:String
    
    
    var body: some View {       
            HStack(spacing: 20){
                // Image
                    Image("SampleUser")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .clipShape(Circle())
                        .background(
                            Color.white
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                        )
                    
                //Details(name and email
                VStack(alignment: .leading, spacing: 5){
                    Text(UserName)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    Text(UserEmail)
                        .font(.callout)
                }
                
                Spacer()
            }
            .padding(.leading,30)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(UserName: "Harsh", UserEmail: "harsh123@gmail.com")
    }
}
