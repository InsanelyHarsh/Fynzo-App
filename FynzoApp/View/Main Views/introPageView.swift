//
//  introPageView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 16/09/21.
//
//star rating, simely, nps scale(5)
//long text,short text
import SwiftUI
import CoreData


struct introPageView: View {
    
    @StateObject var UserLoginDataVM = UserLoginDataViewModel()
    
    var isEmpty: Bool {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserLoginDetails")
            let count = try CoreDataManager02.Shared.PersistentContainer.viewContext.count(for: request)
            return count == 0
        } catch {
            return true
        }
    }
    
    var body: some View {
        ZStack{
            if isEmpty{
                FirstView()
            }
            else{
                ContentView()
            }
        }.onAppear(perform: {
            UserLoginDataVM.GetALLData()
        })
    }
}

struct introPageView_Previews: PreviewProvider {
    static var previews: some View {
        introPageView()
    }
}
