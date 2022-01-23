//
//  DetailsForSurveyQuestions.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 27/09/21.
//

import Foundation

/*
question_type_id = 0 :- Statement       array

question_type_id = 1 :- Long Text (istextbox = 1)       object

question_type_id = 1 :- short Text (istextbox = 0)      object
 
question_type_id = 2 :- CheckBox (Tick Options)     array

question_type_id = 3 :- RadioButton (MCQ)       array

question_type_id = 4 :- dropDown        array

question_type_id = 5 :- Star (isNps = 0 & shape = 0), scale=> how many stars, label => Text along with every star       object

question_type_id = 5 :- Simely (isNps = 0 & shape = 1), scale=> how many simelys, label => Text along with every simely

question_type_id = 5 :- NPS scale (isNps = 1 & shape = 0), scale=> how many parts of scale, label => Text along with every scale distribution
 
question_type_id = 6 :- ranking     array
 
question_type_id = 7 :- DOB     array
 
question_type_id = 8 :- photo     array

question_type_id = 9 :- provide your details     array

 */

/*
 *IMPORTANT JSON:
 
                 "screen_no": "1",
                 "question_text": "Welcome to Italian Pizza Bite (Statement)",
                 "question_type_id": "0",
                 "question": [],
                 "dquestion": []
 
 {
                 
                 "screen_no": "2",
                 "question_text": "How was the food quality (Radiobutton)",
                 "question_type_id": "3",
                 "question": [
                     {
                         "id": "157997",
                         "questionnaire_question_id": "155069",
                         "choice": "Excellent",
                     },
                     {
                         "id": "157998",
                         "questionnaire_question_id": "155069",
                         "choice": "Good",
                         "status": "0",
                     },
                     {
                         "id": "157999",
                         "questionnaire_question_id": "155069",
                         "choice": "Average",
                     },
                     {
                         "id": "158000",
                         "questionnaire_question_id": "155069",
                         "choice": "Dissatisfied",
                     }
                 ],
                 "dquestion": []
             }
 */

//MARK: Intro View (mine)
/*
 var body: some View {
//        ZStack{
//            ForEach(UserLoginDataVM.userlogindetails , id:\.id){
//                i in
//                if i.msg == "Login successfully"{
//                    ContentView()
//                }
//                else{
                 ZStack{
                     VStack(){
                         HStack(spacing:30){
                             Image("Logo")
                                 .resizable()
                                 .frame(width: 90, height: 90)
                                 .padding(.leading,5)
                             
                             Text("FYNZO APP")
                                 .fontWeight(.bold)
                                 .font(.system(size: 40))
                             
                             Spacer()
                         }.padding(.vertical,5)
                         .background(
                             Color.gray.opacity(0.5)
                                 .cornerRadius(20)
                                 .ignoresSafeArea()
                         )
                         .opacity(0)
                         
                         /// **MAIN BODY**
                         VStack(spacing:30){
                             /// **Images**
                             Image("home")
                                 .resizable()
                                 .frame(width: 340, height: 340, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                 .cornerRadius(10)
                             //Create Acc Button
                             Button(action: {
                                 createAccIsShown.toggle()
                             }, label: {
                                 Text("Create An Account")
                                     .fontWeight(.bold)
                                     .font(.system(size: 30))
                                     .padding()
                                     .foregroundColor(.black)
                                     .background(
                                         Color.white.opacity(0.7)
                                             .cornerRadius(20)
                                     )
                             })
                             .fullScreenCover(isPresented: $createAccIsShown, content: {
                                 CreateAccView(createAccIsShown: $createAccIsShown)
                             })
                             
                             /// **SIGN & DEMO Button**
                             HStack{
                                 Button(action: {
                                     SignIsShown.toggle()
                                 }, label: {
                                     Text("Sign in")
                                         .fontWeight(.medium)
                                         .font(.system(size: 18))
                                         .foregroundColor(.black)
                                         .background(
                                             RoundedRectangle(cornerRadius: 10)
                                                 .foregroundColor(.white.opacity(0.4))
                                                 .frame(width: 140, height: 50, alignment: .center)
                                         )
                                         .frame(width: 170, height: 50, alignment: .center)
                                 })
                                 .fullScreenCover(isPresented: $SignIsShown, content: {
                                     LoginView()
                                 })
                                 
                                 Spacer()
                                 
                                 Button(action: {
                                     DemoSurveyIsShown.toggle()
                                 }, label: {
                                     Text("Demo Surveys")
                                         .fontWeight(.medium)
                                         .font(.system(size: 18))
                                         .padding()
                                         .foregroundColor(.black)
                                         .background(
                                             RoundedRectangle(cornerRadius: 10)
                                                 .foregroundColor(.white.opacity(0.4))
                                                 .frame(width: 140, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                         )
                                         .frame(width: 170, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                 }).fullScreenCover(isPresented: $DemoSurveyIsShown, content: {
                                     DemoSurveyView()
                                 })
                                 
                             }
                             
                             
                         }
                         Spacer()
                     }
                     
                     .background( Image("background6")
                                     .blur(radius: 50)
                                     .ignoresSafeArea())
                     
                     
                     
                     
                     /// *LOGO*
                     VStack{
                         HStack(spacing:30){
                             Image("Logo")
                                 .resizable()
                                 .frame(width: 90, height: 90)
                                 .padding(.leading,5)
                             
                             Text("FYNZO APP")
                                 .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                 .font(.system(size: 40))
                                 .foregroundColor(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)))
                             
                             Spacer()
                         }.padding(.vertical,5)
                         .background(
                             Color.white
                                 .blur(radius: 5)
                                 .opacity(0.7)
                                 .cornerRadius(20)
                                 .ignoresSafeArea()
                         )
                         Spacer()
                     }
                 }
//                }
//            }
//        }
 }
 */
