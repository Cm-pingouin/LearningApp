//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import SwiftUI

struct ContentViewRow: View {
    
    // Declaration Proprety
    @EnvironmentObject var model:ContentModel
    
    var index:Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 30){
                
                //Index of lesson
                Text(String(index+1))
                    .bold()
                
                VStack(alignment:.leading){
                    
                    //HeadLine
                    Text(lesson.title)
                        .bold()

                    //Time
                    Text(lesson.duration)
                }
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}

