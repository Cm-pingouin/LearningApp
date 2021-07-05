//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import SwiftUI

struct HomeViewRow: View {
    
    //Declaration of proprety
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        // model card lesson and test
        ZStack{
            //forme
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            //contenu
            HStack{
                //Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Spacer()
                //Text
                VStack(alignment: .leading, spacing:10){
                    
                    //HeadLine
                    Text(title)
                        .bold()
                    
                    //Description
                    Text(description)
                        .padding(.bottom,20)
                        .font(.caption)
                    //Icons
                    HStack{
                        //Number of lesson/question
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        
                        //Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text(time)
                            .font(Font.system(size: 10))
                        
                    }
                }
                .padding(.leading,20)
            }
            .padding(.horizontal,20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some description", count: "10 Lessons", time: "2 Hours")
    }
}
