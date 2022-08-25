//
//  DataService.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/23/22.
//
//  Contains all the code to fetch JSON data.

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        /* parse json file! */
        
        //1. get a url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathString is not nil, otherwise empty recipe list
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //2. create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        //3. create a data object
        do{
            
            let data = try Data(contentsOf: url)
            
            //4. decode data w/decoder
            let decoder = JSONDecoder()
            do{
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //5. add unique id
                for r in recipeData {
                    r.id = UUID()
                }
                
                //6. return the recipes
                return recipeData
                
            }
            catch{
                // error with parsing json
                print(error)
            }
            
        }
        catch{
            //error with getting data
            print(error)
        }
        
        
        return [Recipe]()
        
    }
    
}
