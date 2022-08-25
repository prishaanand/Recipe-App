//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/24/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    //specific recipe is determined by what the user taps on in the list view
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                //MARK: Instructions
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach (recipe.ingredients, id:\.self){ item in
                        Text("• " + item)
                    }
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
            
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    //note: have to use index, not item
                    ForEach (0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal)
                
                
            }
            
            
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe & pass it the detail view so we can see a preview
        
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
