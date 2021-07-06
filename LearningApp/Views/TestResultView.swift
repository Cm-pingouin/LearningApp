//
//  TestResultView.swift
//  LearningApp
//
//  Created by Carlos Banza on 06/07/2021.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var numCorrect:Int
    
    var resultHeading:String{
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome!"
        }
        else if pct > 0.2{
            return "Doing great!"
        }
        else {
            return "Keep learning"
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(resultHeading)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Text("You got \(numCorrect) out  of \(model.currentModule?.test.questions.count ?? 0 ) questions")
            
            Spacer()
            
        }
    }
}
