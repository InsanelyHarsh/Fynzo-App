//
//  SwiftUIView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 08/09/21.
//

import SwiftUI
//5ec3774d151408385e4f09c9cb0f4207
struct CreateAccView: View {
    
    //    @State var GoLogin:Bool = false
    @Binding var createAccIsShown:Bool
    @StateObject var UserSignUPInput = SignUPViewModel()
    @State var TermConditions:Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        
        
        VStack {
            //MARK: BACK Button & Header
            ZStack{
                
                Color.blue.opacity(0.5).frame(width: UIScreen.main.bounds.width,height: 90)
                    .ignoresSafeArea()
                
                HStack{
                    Button(action: {
                            presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color.white)
                            .padding([.leading,.bottom],20)
                            .padding(.bottom,40)
                    })

                    Spacer()
                }
            }.padding(.bottom,-60)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                //MARK: LOGO
                Image("logo_with_name")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.width, alignment: .center)
                    .padding()
                    .background(Color.blue)
                
                VStack(alignment: .center,spacing:60){
                    
                    

    //MARK: Text Fields & Terms Conditions
                    
                    VStack(spacing:20)
                    {
                        
                        UserDetailsView(text: $UserSignUPInput.NewUserName, placeholder: "Name", keyboardType: .default)
                        
                        EmailInputView(text: $UserSignUPInput.NewUserEmail)
                        
                        UserDetailsView(text: $UserSignUPInput.NewUserMobileNumber, placeholder: "Mobile Number", keyboardType: .numberPad)
                        
                        InputPassView(password: $UserSignUPInput.NewUserPassword, placeholder: "Pass", sfSymbol: "lock")
                        
                        UserDetailsView(text: $UserSignUPInput.NewUserCompany, placeholder: "Company/Organization*", keyboardType: .default)
                        
    //Terms & Conditions
                        HStack
                        {
                            Button {
                                TermConditions.toggle()
                            } label:
                            {
                                Image(systemName: TermConditions ? "checkmark.square.fill":"checkmark.square")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                            }
                            
                            Text("I agree with the Terms & Conditions.")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 24))
                                .fontWeight(.medium)
                        }
                    }
                    
                    
                    
    //MARK: Login and Sign Buttons
                    
                    VStack(alignment:.center,spacing:15)
                    {
                        Button(action: {
                            UserSignUPInput.GetNewUserResponse()
                        }, label: {
                            Text("SIGN UP")
                                .frame(width: 280, height: 50, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 0)
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
                                
                            },
                                   label: {
                                Text("SIGN UP with GOOGLE")
                                    .frame(width: 280, height: 50, alignment: .center)
                                    .background(Color(#colorLiteral(red: 0.8594390154, green: 0.3067035377, blue: 0.2521885633, alpha: 1)))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 0)
                                            .stroke(Color.blue, lineWidth: 0)
                                    )
                            })
                            
                            Button(action: {
                                
                            },
                                   label: {
                                Text("SIGN UP with FACEBOOK")
                                    .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color(#colorLiteral(red: 0.2593433857, green: 0.3516628146, blue: 0.6764663458, alpha: 1)))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 0)
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
        }
//            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).cornerRadius(10))
//            .ignoresSafeArea(.container, edges: .bottom)
            
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccView(createAccIsShown: .constant(true))
    }
}
