//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/23/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        // create an instance of DataService & get the data
        
        //non-static version
        //let service = DataService()
        //self.recipes = service.getLocalData()
        
        //static version
        self.recipes = DataService.getLocalData()
        
    }
    
    
}
