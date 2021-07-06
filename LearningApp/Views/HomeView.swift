//
//  HomeView.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    //Declaration proprety
    @EnvironmentObject var model:ContentModel
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                Text("What do you want  to do today?")
                    .padding(.leading,20)
                
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(model.modules){ module in
                            
                            VStack(spacing:20){
                                
                                // Learning NagivationLink
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        }),
                                    tag : module.id,
                                    selection: $model.currentSelected,
    
                                    label: {
                                        //Learning Card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        
                                    })
                                
                                
                                // Test Card
                                HomeViewRow(image: module.test.image, title: "Test \(module.category)", description: module.test.description, count: "\(module.test.questions.count) Test", time: module.test.time)
                            }
                        }
                    }.padding()
                    .accentColor(.black)
                }
            }
            .navigationBarTitle("Get Started")
        }
    }  
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
        
    }
}
