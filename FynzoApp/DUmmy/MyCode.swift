//
//  MyCode.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 14/10/21.
//

import Foundation
//MARK: Create New Account 
/*
 ZStack{
     VStack{
         HStack {
             Text("Create New Account")
                 .font(.system(size: 35))
                 .fontWeight(.medium)
                 .padding(.leading,20)
                 .padding(.top,40)
             
             Spacer()
             
             Button(action: {
                 withAnimation {
                     createAccIsShown = false
                 }
             }, label: {
                 Image(systemName: "xmark")
                     .resizable()
                     .frame(width: 25, height: 25, alignment: .center)
                     .padding(.bottom,80)
                     .padding(.trailing)
             })
         }
         
         
         ScrollView(.vertical, showsIndicators: false, content: {
             VStack(alignment: .center,spacing:50){
                 VStack(spacing:20){
                     
                     UserDetailsView(text: $UserSignUPInput.NewUserName, placeholder: "Name", keyboardType: .default)
                     
                     EmailInputView(text: $UserSignUPInput.NewUserEmail)
                     
                     UserDetailsView(text: $UserSignUPInput.NewUserMobileNumber, placeholder: "Mobile Number", keyboardType: .numberPad)
                     
                     InputPassView(password: $UserSignUPInput.NewUserPassword, placeholder: "Pass", sfSymbol: "lock")
                     
                     UserDetailsView(text: $UserSignUPInput.NewUserCompany, placeholder: "Company/Organization*", keyboardType: .default)
                 }
                 
                 
                 VStack(alignment:.center,spacing:30){
                     Button(action: {
                         UserSignUPInput.GetNewUserResponse()
                     }, label: {
                         Text("SIGN UP")
                             .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                             .background(Color.blue)
                             .foregroundColor(.white)
                             .font(.system(size: 20, weight: .bold))
                             .cornerRadius(10)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                     .stroke(Color.blue, lineWidth: 0)
                             )
                     })
                     .alert(isPresented: $UserSignUPInput.ShowMsg, content: {
                         Alert(
                             title: Text(UserSignUPInput.MsgForUser),
                             message: Text("😀")
                         )
                     })

                     VStack(spacing:10){
                         Button(action: {
                             
                         }, label: {
                             Text("SIGN UP with GOOGLE")
                                 .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                 .background(Color(#colorLiteral(red: 0.8594390154, green: 0.3067035377, blue: 0.2521885633, alpha: 1)))
                                 .foregroundColor(.white)
                                 .font(.system(size: 20, weight: .bold))
                                 .cornerRadius(10)
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                         .stroke(Color.blue, lineWidth: 0)
                                 )
                         })
                         
                         Button(action: {
                             
                         }, label: {
                             Text("SIGN UP with FACEBOOK")
                                 .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                 .background(Color(#colorLiteral(red: 0.2593433857, green: 0.3516628146, blue: 0.6764663458, alpha: 1)))
                                 .foregroundColor(.white)
                                 .font(.system(size: 20, weight: .bold))
                                 .cornerRadius(10)
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                         .stroke(Color.blue, lineWidth: 0)
                                 )
                         })
                     }
                     
                     
                     Button(action: {
//                                GoLogin.toggle()
                     }, label: {
                         Text("Login?")
                             .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                             .foregroundColor(.black)
                             .font(.system(size: 20, weight: .bold))
                     })
//                            .fullScreenCover(isPresented: $GoLogin, content: {
//                                LoginView()
//                            })
                 }
                 
                 Spacer()
             }
         })
         .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).cornerRadius(10))
         .ignoresSafeArea(.container, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
     }
     
 }
 */
