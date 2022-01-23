//
//  RatingView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 26/09/21.
//

import SwiftUI







struct NewRatingView: View {
    @State var Rating:Int? = 0
    @State var ratingQuestion:String
    @State var NumberofStars:String
    @State var Label:String
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    func starType(index:Int)->String{
        
        if let rating = Rating{
            return index <= rating ? "star_active":"star_inactive"
        }
        else{
            return "star"
        }
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .center){

                Text(ratingQuestion)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                
                if horizontalSizeClass == .compact{
                    HStack{
                        
                        let scale = Int(NumberofStars)
                        ForEach((1...scale!), id:\.self){index in
                            
                            Image(starType(index: index))
                                .resizable()
                                .foregroundColor(.orange)
                                .scaledToFit()
                                .frame(maxWidth:60, maxHeight:60)
                                .onTapGesture {
                                    Rating = index
                                    print("tapped")
                                }
                        }
                    }
                    HStack{
                       Text(Label)
                            .scaledToFit()
                    }
                }
                else{
                    HStack{
                        let scale = Int(NumberofStars)
                        ForEach((1...scale!), id:\.self){index in
                            
                            Image(starType(index: index))
                                .resizable()
                                .foregroundColor(.orange)
                                .scaledToFit()
                                .frame(maxWidth:100, maxHeight:100)
                                .onTapGesture {
                                    Rating = index
                                    print("tapped")
                                }
                        }
                    }
                    HStack{
                       Text(Label)
                            .scaledToFit()
                    }
                }
                
            }
        
            
            .padding(.bottom,80)

        }
    }
}











struct RatingView: View {
    @State var Rating:Int? = 0
    @State var ratingQuestion:String
    @State var NumberofStars:String
    @State var Label:String
    @State var i:Int
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    func starType(index:Int)->String{
        
        if let rating = Rating{
            return index <= rating ? "star_active":"star_inactive"
        }
        else{
            return "star"
        }
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .center){

                Text(ratingQuestion)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                
                if horizontalSizeClass == .compact{
                    HStack{
                        
                        let scale = Int(NumberofStars)
                        ForEach((1...scale!), id:\.self){index in
                            
                            Image(starType(index: index))
                                .resizable()
                                .foregroundColor(.orange)
                                .scaledToFit()
                                .frame(maxWidth:60, maxHeight:60)
                                .onTapGesture {
                                    Rating = index
                                    print("tapped")
                                    ViewM.finalArray[i].Response = "\(index)"
                                    print("\(ViewM.finalArray[i])")
                                }
                        }
                    }
                    HStack{
                       Text(Label)
                            .scaledToFit()
                    }
                }
                else{
                    HStack{
                        let scale = Int(NumberofStars)
                        ForEach((1...scale!), id:\.self){index in
                            
                            Image(starType(index: index))
                                .resizable()
                                .foregroundColor(.orange)
                                .scaledToFit()
                                .frame(maxWidth:100, maxHeight:100)
                                .onTapGesture {
                                    Rating = index
                                    print("tapped")
                                    ViewM.finalArray[i].Response = "\(index)"
                                    print("\(ViewM.finalArray[i])")
                                }
                        }
                    }
                    HStack{
                       Text(Label)
                            .scaledToFit()
                    }
                }
                
            }
            .onChange(of: ViewM.finalArray[i].Response, perform: { newValue in
                print("updated array: \(newValue)")
                print("")
            })
//            .onChange(of: Rating, perform: { newValue in
//                print("new rating: \(newValue ?? 69)")
//                print("index:\(i)")
//                print("")
//            })
            .onAppear(perform: {
                if let rating = Int(ViewM.finalArray[i].Response){
                    Rating = rating
                    print("rating:\(rating)")
                }
                else{
                    Rating = 0
                    print("rating: 0")
                }
            })
            
            .padding(.bottom,80)

        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(Rating: 0, ratingQuestion: "Q. Rating Your Dining Experience ",NumberofStars: "10", Label: "asdas,,,,hsdgh sfjksfhk sfsfd,sdfsjkfhjksf jljsdkjf,zxc vgg,ggg,fff ff f ffff fsdssvvvgg wf,dfgdfdfgdfg", i: 0)
    }
}

/*
 dictionarys: ["155099": "6", "155075": "2", "155085": "5", "155074": "5", "155072": "5", "155076": "0", "155073": "5", "155084": "1", "155083": "0", "155067": "0", "155079": "1", "155088": "5", "155081": "7", "155087": "8", "155077": "1", "155082": "7", "155068": "0", "155086": "4", "155078": "1", "155069": "3", "155080": "3", "155071": "5", "155098": "9", "155070": "5"]
 
 
 Lists : [["155067", "155068"], ["155069", "155086", "155088"], ["155070"], ["155083"], ["155085"], ["155075"], ["155084"], ["155071", "155076", "155077", "155078", "155079"], ["155072", "155080"], ["155073", "155081", "155082"], ["155074"], ["155087"], ["155098"], ["155099"]]
 
 {
 }
 */
