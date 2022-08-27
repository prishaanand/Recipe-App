//
//  ContentView.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/23/22.
//

import SwiftUI

struct RecipeListView: View {
    
    // reference the view model
    //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0){
                
                Text("All Recipes")
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 10)
                    .font(Font.custom("Madista Calligraphy", size: 48))
                    .opacity(0.8)
                
                //change list into a scrollview to eliminate lines between elements
                ScrollView{
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipes){ r in
                            //make recipe elements tappable
                            NavigationLink(destination: RecipeDetailView(recipe:r),
                                           label: {
                                
                                //MARK: Row item
                                HStack(spacing: 20.0){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .opacity(0.75)
                                            .font(Font.custom("Afterglow-Regular", size: 25))
                                        RecipeHighlights(highlights: r.highlights)
                                            .foregroundColor(.black)
                                            .opacity(0.5)
                                            .font(Font.custom("Afterglow-Regular", size: 20))
            
                                        
                                    }
                                    
                                }
                            })
                            
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            //.navigationBarTitle("All Recipes")
            .navigationBarHidden(true)
            .padding(.leading)
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
