//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    // Declaration Proprety
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoUrl + (lesson?.video ?? "") )
        
        VStack{
            //Show video if we avais a url not nil
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            //Description
            CodeTextView()
            
            
            // Net Lesson Button
            if(model.hasNextLesson()){
                Button(action: {
                    
                    model.nextLesson()
                }, label: {
                    ZStack{
                        
                        RectangleCardButton(color: Color.green)
                            .frame(height:48)
                        
                        Text("Next Lesson : \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
            else{
                // Back to the home page
                Button(action: {
                    
                    model.currentContentSelected = nil
                }, label: {
                    ZStack{
                        
                        RectangleCardButton(color: Color.green)
                            .frame(height:48)
                        
                        Text("Completed")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}
