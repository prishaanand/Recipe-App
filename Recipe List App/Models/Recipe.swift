//
//  Recipe.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/23/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
    
    //note: if you are not interested in a piece of data in the json file, simply don't create a property for it (decoder will skip it)
}

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
    
}
