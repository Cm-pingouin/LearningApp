//
//  ContentView.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    //Declaration proprety
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView{
            
            LazyVStack{
                
                //confirm that currentModel is set
                if model.currentModule != nil{
                    
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                       NavigationLink(
                        destination: ContentDetailView()
                            .onAppear(perform: {
                                model.beginLesson(index)
                            }),
                        label: {
                            // Lesson Card
                             ContentViewRow(index: index)
                        })
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
