//
//  RectangleCardButton.swift
//  LearningApp
//
//  Created by Carlos Banza on 06/07/2021.
//

import SwiftUI

struct RectangleCardButton: View {
    
    //Declaration proprety
    var color = Color.white
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
