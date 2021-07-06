//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Carlos Banza on 05/07/2021.
//

import SwiftUI
import AVKit

struct CodeTextView: UIViewRepresentable {
    
    // Declaration Proprety
    @EnvironmentObject var model:ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        //Set the attributed text for the lesson
        textView.attributedText = model.lessonDescription
        
        //scroll back te the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
        
        
    }
}
