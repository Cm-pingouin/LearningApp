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
    
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    
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
}
