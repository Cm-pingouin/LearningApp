//
//  ContentModel.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import Foundation

class ContentModel: ObservableObject{
    
    //Declaration of the proprety
    @Published var modules = [Module]()
    
    // Current Module
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    // Current Lesson
    @Published var currentLesson:Lesson?
    var currentLessonIndex = 0
    
    // Current Question
    @Published var currentQuestion:Question?
    var currentQuestionIndex = 0
    
    // lessonDescription NSAttributed
    @Published var lessonDescription = NSAttributedString()
    var styleData: Data?
    
    // Current selected for nagivation link
    @Published var currentContentSelected:Int?
    @Published var currentTestSelected:Int?
    
    init() {
        
        //Get local data module
        getLocalData()
    }
    
    // Mark - Data
    //Get local data Parsing JSON File
    func getLocalData(){
        
        //get a url to JSON File
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do{
            //Read the file into a data Json
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonObjet = JSONDecoder()
            
            //try to decode the json an array of module
            let modules = try jsonObjet.decode([Module].self, from: jsonData)
            
            //assign objet modules
            self.modules = modules
        }
        catch{
            //impossible to parse de the file
            print(error)
        }
        
        //get a url to html file
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            //Read the file
            let styleData = try Data(contentsOf: styleUrl!)
            
            //assign
            self.styleData = styleData
        }catch{
            //impossible to parse de the file
            print(error)
        }
    }
    
    
    //Mark - Function
    //get module by id
    
    func beginModule(_ moduleId:Int){
        
        //Find the index for this module id
        for index in 0..<modules.count{
            if modules[index].id ==  moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        //set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    //get lesson by id lesson
    func beginLesson(_ moduleId:Int){
        
        //check that lesson index is within range of module lessons
        if moduleId < currentModule!.content.lessons.count{
            currentLessonIndex = moduleId
        }else{
            currentLessonIndex = 0
        }
        
        // set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    //get Question by id lesson
    func beginTest(_ moduleId:Int){
        
        // set the  current module
        beginModule(moduleId)
        
        // set the current question
        currentQuestionIndex = 0
        
        if currentModule?.test.questions.count ?? 0 > 0 {
            
            currentQuestion = currentModule?.test.questions[currentQuestionIndex]
            lessonDescription = addStyling(currentQuestion!.content)
        }
    }
    
    func nextQuestion(){
        
        // advance the question index
        currentQuestionIndex += 1
        
        //Check that it's  within the range of  of questions
        if  currentQuestionIndex < currentModule!.test.questions.count{
            
            currentQuestion = currentModule?.test.questions[currentQuestionIndex]
            lessonDescription = addStyling(currentQuestion!.content)
        }
        else{
            
            currentQuestionIndex = 0
            currentQuestion = nil
        }
    }
    //check if there's a next lesson
    func hasNextLesson() -> Bool{
        
        return (currentLessonIndex+1 < currentModule!.content.lessons.count)
    }
    
    //Get the next lesson
    func nextLesson() {
        
        //Advence index
        currentLessonIndex += 1
        
        //check if index isn't out of range
        if(currentLessonIndex < currentModule!.content.lessons.count){
            
            //set the lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else{
            //reseting
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    // MARK - add style
    
    private func addStyling(_ htmlString:String) -> NSAttributedString{
        
        var resultString = NSAttributedString()
        var data = Data()
        
        //Add the styling data
        if styleData != nil{
            data.append(styleData!)
        }
        
        //Add the thml data
        data.append(Data(htmlString.utf8))
        
        // Convert to attribut string
        if let attributedString  = try? NSAttributedString(data: data, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil){
             
            resultString = attributedString
        }
        
        return resultString
    }
    
}
