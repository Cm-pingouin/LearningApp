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
    @State var selectedAnswersIndex:Int?
    @State var numCorrect = 0
    @State var submit = false
    
    var body: some View {
        
        VStack{
            if model.currentQuestion != nil {
                VStack{
                    //Questions Number
                    Text("Question \(model.currentQuestionIndex + 1 ) of \(model.currentModule?.test.questions.count ?? 0)")
                        .padding(.leading, 20)
                    
                    //Questions
                    CodeTextView()
                        .padding(.horizontal,20)
                    //Answers
                    
                    ScrollView{
                        LazyVStack{
                            ForEach(0..<model.currentQuestion!.answers.count , id : \.self) { index in
                                
                                Button {
                                    selectedAnswersIndex = index
                                }label: {
                                    ZStack{
                                        
                                        if( submit == false){
                                            RectangleCardButton(color: index == selectedAnswersIndex ? .gray : .white)
                                                .frame(height:48)
                                        }else{
                                            
                                            if index == selectedAnswersIndex && index == model.currentQuestion!.correctIndex || index == model.currentQuestion!.correctIndex{
                                                
                                                RectangleCardButton(color: .green)
                                                    .frame(height:48)
                                            }
                                            else if index == selectedAnswersIndex && index != model.currentQuestion!.correctIndex{
                                                
                                                RectangleCardButton(color: .red)
                                                    .frame(height:48)
                                            }
                                            else{
                                                RectangleCardButton(color: .white)
                                                    .frame(height:48)
                                            }
                                        }
                                        
                                        
                                        Text(model.currentQuestion!.answers[index])
                                        
                                    }
                                }.disabled(submit)
                                
                            }
                            
                        }.padding()
                        .accentColor(.black)
                    }
                    
                    
                }.navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            }
            else{
                TestResultView(numCorrect: numCorrect)
            }
            
            //Button
            Button{
                // check if  answer has been submitted
                if submit{
                    // if is submitted pass to the next question
                    model.nextQuestion()
                    
                    //reset proprety
                    selectedAnswersIndex = nil
                    submit = false
                }else{
                    // if not submitted the answer
                    submit = true
                    numCorrect += selectedAnswersIndex == model.currentQuestion!.correctIndex ? 1 : 0
                }
                
            } label: {
                ZStack{
                    
                    RectangleCardButton(color: .green)
                        .frame(height:48)
                    
                    Text(buttonText)
                        .foregroundColor(.white)
                    
                }.padding()
                
            }.disabled(selectedAnswersIndex == nil)
            
        }
        
    }
    
    var buttonText:String{
        
        if submit{
            if model.currentQuestionIndex + 1 == model.currentModule?.test.questions.count{
                return "Finish"
            }
            else{
                return "Next"
            }
        }
        else{
            return "Submit"
        }
    }
}
