//
//  TestView.swift
//  LearningApp
//
//  Created by Carlos Banza on 06/07/2021.
//

import SwiftUI

struct TestView: View {
    
    //Declaration proprety
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack{
            //Questions Number
            Text("Question \(model.currentQuestionIndex + 1 ) of \(model.currentModule?.test.questions.count ?? 0)")
            
            //Questions
            CodeTextView()
            
            //Answers
            
            
            //Button
            
            
        }.navigationBarTitle("\(model.currentModule?.category ?? "") Test")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentModel())
    }
}
