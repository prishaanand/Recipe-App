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
    
    //calculate portions for different serving sizes
    //note that num and denom can be nil!
    //make static so it can be called w/o an instance of RecipeModel
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        //check denom or num exists no
        if ingredient.num != nil  {
            //get single serving size by multiplying denom by recipe servings
            denominator *= recipeServings
            
            //get target portion by multiplying numerator by selected servings
            numerator *= targetServings
            
            //reduce fraction by GCD
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
             
            //turn into mixed frac, if needed
            if (numerator >= denominator) {
                //whole portion
                wholePortions = numerator/denominator
                //remainder portion
                numerator = numerator % denominator
                //assign to portions string
                portion += String(wholePortions)
            }
            
            //express fraction if it exists
            if (numerator > 0) {
                
                //check if space needed
                if (wholePortions > 0) {
                    portion += " "
                }
                
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        // calculate appropriate suffix
        if var unit = ingredient.unit {
            
            //pluraize
            if wholePortions > 1 {
                //non-exhaustive
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                }
                else {
                    unit += "s"
                }
            }
            
            //spacing
            if !(ingredient.denom == nil && ingredient.num == nil) {
                portion += " "
            }
            
            return portion + unit
        }
 
        return portion
        
    }
    
    
}
