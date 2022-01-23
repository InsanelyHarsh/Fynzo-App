//
//  LoginPreviewModifier.swift
//  FynzoApp
//
//  Created by Harsh Yadav on 07/09/21.
//

import Foundation
import SwiftUI
//custom Modifier for (https://youtu.be/m6WG46oyTyY)
struct PreviewLayoutCOmponetModifier:ViewModifier{
    let Name:String
    func body(content: Content) -> some View {
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(Name)
            .padding()
    }
}


extension View {
    func Preview(with Name:String) -> some View{
        self.modifier(PreviewLayoutCOmponetModifier(Name: Name))
    }
}
