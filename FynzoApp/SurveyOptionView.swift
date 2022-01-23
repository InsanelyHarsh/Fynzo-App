//
//  SurveyOptionView.swift
//  SurveyApp
//
//  Created by Harsh Yadav on 16/09/21.
//
import SwiftUI


struct SurveyOptionView: View {
    @State var SelectedOption:String = ""
    @State var questionNumber:Int = 1
    
    var body: some View {
        NavigationView{
            VStack(){
                
                if questionNumber == 1 {
                    Questions(SelectedOption: $SelectedOption, Question: "Dine In/ Take Out?", NumberOfOption: 2, option1: "Dine In", option2: "Take Out", option3: "", option4: "")

                }
                
                if questionNumber == 2 {
                    Questions(SelectedOption: $SelectedOption, Question: "How was the fodd Quality", NumberOfOption: 4, option1: "Excellent", option2: "Good", option3: "Average", option4: "Dissatisfied")
                }
                
                if questionNumber == 3{
                    Questions(SelectedOption: $SelectedOption, Question: "Overall Service Quality", NumberOfOption: 4, option1: "Excellent", option2: "Good", option3: "Average", option4: "Dissatisfied")
                }
                
                if questionNumber == 4{
                    Questions(SelectedOption: $SelectedOption, Question: "Overall Cleanliness", NumberOfOption: 4, option1: "Excellent", option2: "Good", option3: "Average", option4: "Dissatisfied")
                }
                
                if questionNumber == 5{
                    Questions(SelectedOption: $SelectedOption, Question: "Speed of Service", NumberOfOption: 4, option1: "Very Fast", option2: "Fast", option3: "Decent", option4: "Dissatisfied")
                }
                
                
                
                Spacer()
                
                Text("1/10")
                    .font(.title)
                    
                    .navigationTitle("Survey")
                    
                    .navigationBarItems(leading:Button(action: {
                        withAnimation(.easeInOut){
                            questionNumber -= 1
                        }
                    }, label: {
                        Text("Prev.")
                    }),
                    
                    trailing: Button(action: {
                        withAnimation(.easeInOut(duration: 1)){
                            questionNumber += 1
                        }
                    }, label: {
                        Text("Next")
                    }))
            }
        }
    }
    
    
    
}

struct SurveyOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyOptionView()
    }
}

struct Questions: View {
    @Binding var SelectedOption:String
    let Question:String
    let NumberOfOption:Int
    let option1:String
    let option2:String
    let option3:String
    let option4:String
    
    var body: some View {
        
        let optionArray:[String] = [option1,option2,option3,option4]
        
        
        VStack(spacing:60){
            //Question:
            Text(Question)
                .font(.system(size: 25))
            
            
            //Options:
            VStack(alignment: .leading,spacing:20){
                
                
                ForEach(0..<NumberOfOption) { i in
                    Button(action: {
                        SelectedOption = optionArray[i]
                    }, label: {
                        Text(optionArray[i])
                            .foregroundColor(.black)
                            .frame(width: 250, height: 70, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(SelcColor(option: optionArray[i]), lineWidth: 5)
                            )
                    })
                }
            }.font(.system(size: 20))
            
            Button(action: {
                
            }, label: {
                Text("Sumbit")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 150, height: 60, alignment: .center)
                    .background(Color.blue.cornerRadius(10))
            })
        }
        .frame(width: 330, height: 610, alignment: .center)
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).cornerRadius(10))
    }
    func SelcColor(option:String)-> Color{
        if option == SelectedOption{
            return Color.blue
        }
        else{
            return Color.black
        }
    }
}






//    @ObservedObject var vm = ViewModel()



//                Text("\(ViewModel.State.q1.rawValue)")
//                switch self.vm.state{
//                case .q1:
//                    Question1(SelectedOption: $SelectedOption)
//                case .q2:
//                    Question2(SelectedOption: $SelectedOption)
//                case .q3:
//                    Text("dlf")
//
//
//                }
