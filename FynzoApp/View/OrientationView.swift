//
//  OrientationView.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 04/10/21.
//

import SwiftUI

struct OrientationView: View {
    var body: some View {
//        NavigationView{
//            VStack{
//                Text("hello")
//                Text("this is harsh")
//            }
//        }
        GeometryReader { proxy in
            if proxy.size.width < proxy.size.height
            {
                NavigationView {
                    // potrait/ default
                    Text("portrait")

                        .navigationTitle("Portrait")
                }
            }
            if proxy.size.width > proxy.size.height
            {
                NavigationView {
                    // landscape
                    VStack{
                        Text("Landscape")

                    }
                        .navigationTitle("Landscape")
                        .navigationBarTitleDisplayMode(.large)
                }
            }
        }
    }
}

struct OrientationView_Previews: PreviewProvider {
    static var previews: some View {
        OrientationView()
//        if #available(iOS 15.0, *) {
//            OrientationView()
//                .previewInterfaceOrientation(.landscapeLeft)
//        } else {
//            // Fallback on earlier versions
//            Text("only ")
//        }
    }
}
