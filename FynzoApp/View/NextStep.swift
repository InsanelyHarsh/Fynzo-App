////
////  NextStep.swift
////  FynzoApp
////
////  Created by Harsh Yadav on 20/11/21.
////
//
//import SwiftUI
//
////MARK: Model
//struct TestModel:Hashable,Equatable{
//    var Rating:Int
//    var question:String
//    var isRequired:Bool
//    var questionid:String
//}
//
//class TestViewModel:ObservableObject{
//    @Published var QuestionSet:[TestModel] = [TestModel(Rating: 5, question: "First :)", isRequired: true, questionid: "01"),
//                                              ]
//    @Published var RatingSet:[Int] = []
//    @Published var Rating:Int?
//
//    func Create(rating:Int,question:String){
//        //        QuestionSet.append(TestModel(Rating: rating, question: question))
//    }
//
//    func allRating(){
//
//    }
//
//    func all(){
//        //        QuestionSet.append(TestModel(Rating: 5, question: "First :)", isRequired: true, questionid: "01"))
//        //        QuestionSet.append(TestModel(Rating: 5, question: "Second :/", isRequired: false, questionid: "02"))
//        //        QuestionSet.append(TestModel(Rating: 5, question: "THird Question :", isRequired: true, questionid: "03"))
//        //        QuestionSet.append(TestModel(Rating: 5, question: "Last finally :)", isRequired: true, questionid: "04"))
//        print(QuestionSet)
//    }
//    func Check(){
//        print(QuestionSet)
//    }
//}
//
//
//
//
//struct RatingView2: View {
//    @Binding var Rating:Int?
//    @State var vm:TestViewModel
//    @State var ratingQuestion:String
//    @State var NumberofStars:String
//
//    func starType(index:Int)->String{
//        if let rating = Rating{
//            return index <= rating ? "star.fill":"star"
//        }
//        else{
//            return "star"
//        }
//    }
//
//    var body: some View {
//        ZStack{
//            VStack(alignment: .center){
//                Text(ratingQuestion)
//                    .fontWeight(.medium)
//                    .font(.system(size: 20))
//
//                    HStack{
//                        let scale = Int(NumberofStars)
//                        ForEach((1...scale!), id:\.self){index in
//
//                            Image(systemName: starType(index: index))
//                                .resizable()
//                                .foregroundColor(.orange)
//                                .scaledToFit()
//                                .frame(maxWidth:60, maxHeight:60)
//                                .onTapGesture {
//                                    Rating = index
//                                }
//                        }
//                    }
//
//
//
////                Text("\(Rating ?? 100)")
//            }
//            .onChange(of: Rating, perform: { newValue in
//                if let newValue = newValue{
//                    print(newValue)
//                }
//            })
//            .padding(.bottom,80)
//
//        }
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//struct TestView:View{
//
//    @StateObject var vm = TestViewModel()
//
//    var body: some View{
//        NavigationView{
//            VStack{
//                Button {
//                    vm.Check()
//                } label: {
//                    Text("Check")
//                }
//
//                ScrollView(.vertical, showsIndicators: false) {
//                    ForEach(vm.QuestionSet,id:\.self){ j in
//                        Text("\(j.Rating)")
//                    }
//                    ForEach(vm.QuestionSet,id:\.self) { i in
//                        RatingView2(Rating: i.Rating, vm: vm, ratingQuestion: i.question, NumberofStars: "10")
//                    }
//                }
//
//            }
//            .onAppear(perform: {
//                vm.all()
//            })
//            .onChange(of: vm.QuestionSet) { newValue in
//                print(newValue)
//            }
//
//        }
//    }
//}
//
//
//struct TestPreview:PreviewProvider{
//    static var previews: some View{
//        TestView()
//    }
//
//}
//
//
