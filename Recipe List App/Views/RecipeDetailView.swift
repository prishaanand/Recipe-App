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
    //serving size picker
    @State var selectedServingSize = 2
    
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe Title
                //having title below image displays it when clicked on from the featured view
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                //MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size: ")
                    Picker("", selection: $selectedServingSize){
                        //match tag number with serving size in order to see changes reflected in state property
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
            
                //MARK: Instructions
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    ForEach (recipe.ingredients){ item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
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
        //.navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe & pass it the detail view so we can see a preview
        
        let model = RecipeModel()
        
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
