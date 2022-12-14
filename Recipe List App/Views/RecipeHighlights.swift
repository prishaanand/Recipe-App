//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/26/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    //build string by looping through highlights
    init(highlights:[String]) {
        
        for index in 0..<highlights.count {
            
            //dont add comma for last item
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
            
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2"])
    }
}
