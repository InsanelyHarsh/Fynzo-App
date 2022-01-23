//
//  FirstView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import SwiftUI

/**
 First View is First Screen Shown/Displayed to User
 
 All View/Screen Are shown using "**fullScreenCover**"
    ````
Demo Survey
    |
    |
    |
 First View ------ Login/Sign In
    |
    |
    |
New Account
 ````
 It has 3 functionality/Screen to navigate :
 1. Create New Account
 2. Sign In/Login
 3. See Demo(s)
   */
struct FirstView: View {
    
    @State var createAccIsShown:Bool = false
    @State var SignIsShown:Bool = false
    @State var DemoSurveyIsShown:Bool = false
    
    @StateObject var UserLoginDataVM = UserLoginDataViewModel()
    @Namespace var namespace
    
    var body: some View {
        
        ZStack
        {
//MARK: IMAGE
            VStack{
                Image("first_page_large")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height:UIScreen.main.bounds.height*0.8 ,alignment: .center)
//                    .padding(.bottom,-40)
                    .ignoresSafeArea(.container, edges: .top)
                Spacer()
            }
            
//MARK: Options
            VStack{
                Spacer()
                Options(createAccIsShown: $createAccIsShown, DemoSurveyIsShown: $DemoSurveyIsShown, SignIsShown: $SignIsShown)
                    .frame(height: UIScreen.main.bounds.height*0.22, alignment: .center)
                    .background(Color.white)
            }
            
            
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}





//MARK: Options View
struct Options:View{
    @Binding var createAccIsShown:Bool
    @Binding var DemoSurveyIsShown:Bool
    @Binding var SignIsShown:Bool
    
    var body: some View{
        
        VStack(spacing: 10){
//MARK: Buttons(DEMO,LOGIN, NEW ACCOUNT)
            HStack{
                
//MARK: Demo Survey
                Button{
                    DemoSurveyIsShown.toggle()
                }
            label: {
                Text("Demo SURVEYS")
                    .fontWeight(.medium)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width*0.45, height: 60, alignment: .center)
                    .background(Color.red.frame(width: UIScreen.main.bounds.width*0.45, height: 60, alignment: .center))
                    .padding(.leading,20)
            }
            .fullScreenCover(isPresented: $DemoSurveyIsShown, content: {
                DemoSurveyView()
            })
                
                Spacer()
                
//MARK: Log-In
                Button {
                    SignIsShown.toggle()
                } label: {
                    Text("LOG IN")
                        .fontWeight(.medium)
                        .font(.system(size: 23))
                        .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.width*0.45, height: 60, alignment: .center)
                        .background(Color.green.frame(width: UIScreen.main.bounds.width*0.45, height: 60, alignment: .center))
                        .padding(.trailing,20)
                }
                .fullScreenCover(isPresented: $SignIsShown
                                 ,content: {
                    //Destination
                    LoginView(createAccIsShown: $createAccIsShown)
                })
            }
            
            
//MARK: Create New Account
            Button {
                createAccIsShown.toggle()
            } label: {
                Text("CREATE FREE ACCOUNT")
                    .fontWeight(.medium)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: 60, alignment: .center)
                    .background(Color.blue.frame(width: UIScreen.main.bounds.width*0.9, height: 60, alignment: .center))
            }
            .fullScreenCover(isPresented: $createAccIsShown, content: {
                CreateAccView(createAccIsShown: $createAccIsShown)
            })
        }
    }
    
}
