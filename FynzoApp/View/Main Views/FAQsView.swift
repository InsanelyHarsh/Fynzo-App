//
//  FAQsView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 07/09/21.
//

import SwiftUI

struct FAQsView: View {
    var body: some View {
//                Image("background9")
//                    .resizable()
//                    .blur(radius: 100)
            
            
            VStack(alignment: .leading,spacing:20){
                

                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("How to create a survey?")
                            .font(.system(size: 23, weight: .semibold, design: .default))
                            .foregroundColor(Color.blue)

                        Text("There are two ways to create a survey. First one is, you can import the existing template from the app.Second method is helpful when you want to create survey from scratch. For that you will have to log into web admin panel at https://www.fynzo.com/feedback .After login click on 'Surveys-> Create New Survey' in left menu panel.")
                    })
                    .padding()
//                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
//                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5103735513)).cornerRadius(10))
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text(" How to collect responses?")
                            .font(.system(size: 22, weight: .semibold, design: .default))
                            .foregroundColor(Color.blue)

                        Text("To collect the feedback from App, click the start button along the feedback form name in the feedback form list. It will give you options about how you want to open the feedback form.")
                    }).padding()
//                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))

                    Divider()
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("How to send responses to server?")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(Color.blue)

                        Text("If your device is connected to the internet, feedback will be sent to the server automat ically. If it is not connected to the internet, it will be saved in the app and can be synced with the server any time from upload button given on bottom right of the App dashboard.")
                    }).padding()
//                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
                })
                Spacer()
            }
            .navigationTitle("Help")
            .ignoresSafeArea(.container, edges: .bottom)
            .padding(.horizontal)
    }
}

struct FAQsView_Previews: PreviewProvider {
    static var previews: some View {
        FAQsView()
    }
}
