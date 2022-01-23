//
//  MenuView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 06/09/21.
//

import SwiftUI

struct SurveyFormListingID{
    var ID:String = ""
}

struct MenuView: View {

//    let optionImageArray : [String] = ["house","gear","questionmark.circle.fill","iphone","message","arrow.down.right.and.arrow.up.left"]
    
    let optionImageArray :[String] = ["home","my_account","help","contact_us","chat","logout"]
    
    let optionName:[String] = ["Home","Settings","FAQs","Contact US","Chat with US","Exit"]
    
    @StateObject var UserLoginDataVM = UserLoginDataViewModel()
//    @StateObject var VM = SurveyFormListingsViewModel()
    
    @State var isShown:Bool = false
    @Binding var Menu:Bool
    @Binding var ShowAlert:Bool
    
    var body: some View {
        NavigationView {
            VStack{
                
                HeaderView(Menu: $Menu)
                
                ForEach(UserLoginDataVM.userlogindetails , id:\.id){i  in
                    UserDetailView(UserName: "\(i.firstName) \(i.lastName)", UserEmail: i.Email)
                    Text(i.SurveyFormListingID)
                }
//                ForEach(VM.surveyFormListingData , id:\.id) { j in

                    List{
                        Button(action: {
                            Menu = false
                        }, label: {
                            OptionView(name: optionName[0], imageName: optionImageArray[0])
                        })
                        NavigationLink(
                            destination: SettingsView(),
                            label: {
                                OptionView(name: optionName[1], imageName: optionImageArray[1])
                            })
                        NavigationLink(
                            destination: FAQsView(),
                            label: {
                                OptionView(name: optionName[02], imageName: optionImageArray[02])
                            })
                        NavigationLink(
                            destination: ContactUsView(),
                            label: {
                                OptionView(name: optionName[03], imageName: optionImageArray[03])
                            })
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                OptionView(name: optionName[04], imageName: optionImageArray[04])
                            })

//                        ForEach(VM.surveyFormListingData , id:\.id) { x in
//                            VM.DeleteybyID(input: x)
                            
                            
                            Button(action: {
//                                VM.DeleteybyID(input: x)
//                                VM.DeleteybyID(input: VM.surveyFormListingData)
                                UserLoginDataVM.DeleteybyID(input: UserLoginDataVM.userlogindetails[0])
                                UserLoginDataVM.GetALLData()
                                
                                //deleting surveyformListings
                                  
                            }, label: {
                                OptionView(name: optionName[5], imageName: optionImageArray[5])
                            })
//                        }
                        
                        
                        
                        
                    }
//                }
            }
            .navigationBarHidden(true)
        }.onAppear(perform: {
            UserLoginDataVM.GetALLData()
        })
        
    }
}




struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(Menu: .constant(true), ShowAlert: .constant(false))
    }
}




struct HeaderView: View {
    @Binding var Menu:Bool
    
    var body: some View {
        HStack(){
            Text("Menu")
                .font(.system(size: 45, weight: .semibold, design: .default))
                .padding(.leading,30)
            Spacer()
            Button(action: {
                withAnimation(.spring()){
                    Menu = false
                }
            }, label: {
                withAnimation {
                    Image(systemName: "chevron.left.circle")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .rotationEffect(.init(degrees: Menu ? 0 : -180))
                        .padding(.trailing,30)
                        .foregroundColor(.black)
                }
            })
        }
    }
}
