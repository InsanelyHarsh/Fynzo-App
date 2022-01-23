//
//  ContentView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 05/09/21.
//

//com.googleusercontent.apps.1234567890-abcdefg
import SwiftUI
//Client ID:  901631903301-amno31f6ra8sbb57esa5i0k606n8gsf5.apps.googleusercontent.com
//com.googleusercontent.apps.901631903301-amno31f6ra8sbb57esa5i0k606n8gsf5


// 5ec3774d151408385e4f09c9cb0f4207
//harshmyadav2002@gmail.com
//29045
struct ContentView: View {

    
    @State var Menu:Bool = false
    @Namespace var namespace
    @State var isPressed:Bool = false
    @State var showSurvey:Bool = false
    
    @StateObject var VM = SurveyFormListingsViewModel()
    @StateObject var LoginVM = UserLoginDataViewModel()
    
    @State var surveyActive:Bool = false
//    @ObservedObject var SurveyFormListingID:String = ""
    var body: some View {

        
        
        //If-else Condition
        if Menu
        {
            MenuView(Menu: $Menu, ShowAlert: $Menu)
                .matchedGeometryEffect(id: "ID", in: namespace, properties: .frame, anchor: .trailing, isSource: Menu ? true:false)
        }
        
        
        else
        {
            NavigationView{
                ZStack {
//                    ForEach(LoginVM.userlogindetails , id:\.id){i  in
//                        Text(i.firstName)
//                        self.SurveyFormListingID = i.SurveyFormListingID
//                    }
                    
                    VStack{
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(spacing:35){
                                
//MARK: Survey Form Listings
                                if VM.isLoading{
                                    ProgressView()
                                }
                                else{
                                    ForEach(VM.FINAL,id:\.SurveyFormID){ k in
                                        ForEach(k.SurveyData,id:\.id) { j in
                                            if let id = j.id{
                                                Text("\(j.id ?? "nil")")
                                                NavigationLink(isActive: $surveyActive) {
                                                    //                                                DemoView(surveyform_id: Int(j.id ?? "") ?? 0).navigationBarBackButtonHidden(true)
                                                    Demo02View(surveyFormID: Int(id)!).navigationBarHidden(true)
                                                } label: {
                                                    Button {
                                                        surveyActive.toggle()
                                                        ViewM.finalArray = []
                                                        print("current surveyformid:\(id)")
                                                    } label: {
                                                        FeedBackView(SurveyTitle: j.name ?? "", VM: SurveyFormListingsViewModel())
                                                            .cornerRadius(10)
                                                    }
                                                }
                                            }
                                            
                                            
                                            Divider().foregroundColor(Color.blue)
                                        }
                                    }
                                }
                                
                                


//                                ForEach(VM.SurveyListingData , id:\.SurveyFormID) { i in
//
//                                    Text("dsfljksdlf")
//
//
////MARK: Delete button for Listings
////                                    Button(action: {
////                                        VM.DeleteybyID(input: i)
////                                        VM.GetAllSurveyFormListing()
////                                    }, label: {
////                                        Text("Del")
////                                    })
//                                }
                            }
                        })
                        Spacer()
                    }
//MARK: Bottom Part
                    BottomView()
                }
//MARK: Navigation Title
                .navigationTitle("FYNZO")
                
//MARK: Side/MENU Button
                
                .navigationBarItems(leading:
                                        Button(
                                            action:
                                                {
                                                    withAnimation(.linear){
                                                    Menu.toggle()
                                                }
                                            },
                                            label:
                                                {
                                                Image(systemName: "list.bullet")
                                                    .resizable()
                                                    .frame(width: 27, height: 27, alignment: .center)
                                                    .padding(.leading,17)
                                                    .foregroundColor(.black)
                                            }))
                
            }
            .matchedGeometryEffect(id: "ID", in: namespace, properties: .frame, anchor: .leading, isSource: Menu ? false:true)
            
            .onAppear(perform: {
                VM.SurveyFormListing(UserID: 29045)
                javaScrpt().server()
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
//.previewInterfaceOrientation(.landscapeLeft)
    }
}
struct BottomView: View {
    var body: some View {
        VStack{
            Spacer()
            BottomPartView()
//                .padding(.horizontal)
//                .padding(.vertical,5)
        }
    }
}



