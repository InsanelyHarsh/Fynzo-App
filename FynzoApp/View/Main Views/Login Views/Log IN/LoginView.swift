//
//  LoginView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 09/09/21.
//

import SwiftUI
//5ec3774d151408385e4f09c9cb0f4207
struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var createAccIsShown:Bool
    
    @StateObject var loginVM = LoginViewModel()
    
    var body: some View {
//IF user has entered correct Details than move to ContentView/Home Screen
        
        if loginVM.UserStatus{
            ContentView()
        }
        else{
            ZStack
            {
                VStack(alignment:.leading){
    //MARK: Back Button
                    BackButtonView()
                    
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        
    //MARK: Logo
                        Image("logo_with_name")
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width, alignment: .center)
                            .padding()
                            .background(Color.blue)
                        
                        
                        VStack(alignment: .center,spacing:30){
                            
                            VStack(spacing:20){
                                
                                EmailInputView(text: $loginVM.LoginEmail)
                                    .padding(.horizontal)
                                
                                InputPassView(password: $loginVM.LoginPass, placeholder: "Password", sfSymbol: "lock")
                                    .padding(.horizontal)
                                
                                
    //                            if #available(iOS 15.0, *) {
                                    Button(action: {
                                        loginVM.getData()
    //                                    if ((!loginVM.LoginPass.isEmpty) && (!loginVM.LoginEmail.isEmpty)){
    //                                        loginVM.getData()
    //                                    }
    //                                    else{
    //                                        ShowAlert = true
    //                                    }
                                        
                                    }, label: {
                                        Text("Login")
                                            .frame(width: 250, height: 50, alignment: .center)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 0)
                                                    .stroke(Color.blue, lineWidth: 0)
                                            )
                                    })
    //                                    .alert("Please Fill Entries", isPresented: $ShowAlert) {
    //                                        Button("OK", role: .cancel) { }
    //                                    }
                                        
    //                            } else {
                                    // Fallback on earlier versions
    //                            }
                                
    //MARK: OR Line (custom Divider View)
                                OR()
                                
                            }
                            
        
                            VStack(alignment:.center,spacing:10){
                                
                                VStack(spacing:10){
                                    
    //MARK: FaceBook Login Button
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack{
                                            Image("facebook_icon")
                                                .resizable()
                                                .frame(width: 25, height: 25, alignment: .center)
                                            
                                            
                                            Text("SIGN UP with FACEBOOK")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .bold))
                                               
                                        }
                                        .frame(width: 280, height: 50, alignment: .center)
                                        .background(Color(#colorLiteral(red: 0.2593433857, green: 0.3516628146, blue: 0.6764663458, alpha: 1)))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.blue, lineWidth: 0)
                                    )
                                    })
                                    
    //MARK: Google Login Button
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack {
                                            
                                            Image("googleg_standard_color_128dp")
                                                .resizable()
                                                .frame(width: 25, height: 25, alignment: .center)
                                            
                                            Text("SIGN UP with GOOGLE")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .bold))
                                        }
                                        .frame(width: 280, height: 50, alignment: .center)
                                        .background(Color(#colorLiteral(red: 0.8594390154, green: 0.3067035377, blue: 0.2521885633, alpha: 1)))
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.blue, lineWidth: 0)
                                        )
                                    })
                                    
                                    
                                }
                                

                                HStack{
                                    
                                    Button(action: {
                                        
                                        withAnimation(.linear(duration: 5)){
                                            createAccIsShown.toggle()
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                        
                                    }, label: {
                                        Text("Create an Account?")
                                            .underline(true, color: Color.black)
                                            .frame(width: 180, height: 50, alignment: .center)
                                            .foregroundColor(.blue)
                                            .font(.system(size: 15, weight: .bold))
                                    })
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("Forgot Password?")
                                            .underline(true, color: Color.black)
                                            .frame(width: 180, height: 50, alignment: .center)
                                            .foregroundColor(.blue)
                                            .font(.system(size: 15, weight: .bold))
                                    })
                                }
                            }
                            
                            Spacer()
                        }
                    })
                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).cornerRadius(10))
                    .ignoresSafeArea()
                    .ignoresSafeArea(.container, edges: .bottom)
                }
                
    //            VStack{
    //                Spacer()
    //                HStack{
    //                    Button(action: {
    //
    //                    }, label: {
    //                        Image(systemName: "message.circle")
    //                            .resizable()
    //                            .frame(width: 55, height: 55, alignment: .center)
    //                            .foregroundColor(.blue)
    //                            .padding([.leading,.bottom],25)
    //                    })
    //
    //                    Spacer()
    //
    //                }
    //            }
                
            }
        }
//        .onAppear(perform: {
//            loginVM.getData()
//        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(createAccIsShown: .constant(false), loginVM: LoginViewModel())
    }
}


//MARK: Back Button View
struct BackButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            //Background Color
            Colors.ColorAccent.frame(width: UIScreen.main.bounds.width,height: 90)
                .ignoresSafeArea()
            
            //Back Button
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
    }
}


//MARK: OR View
struct OR: View {
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width*0.8/2, height: 2, alignment: .center)
            
            Text("Or")
                .font(.title2)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width*0.8/2, height: 2, alignment: .center)
        }
    }
}
