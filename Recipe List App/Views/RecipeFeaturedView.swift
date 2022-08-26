//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/25/22.
//
import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
        
            //title
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                
            //MARK: geo reader start
            GeometryReader { geo in
            
            TabView (selection: $tabSelectionIndex) {
                
                // loop through recipes
                ForEach (0..<model.recipes.count) { index in
                    
                    // show featured recipes
                    if model.recipes[index].featured == true {
                    
                        // Recipe card button
                        Button(action: {
                            
                            // show recipe detail sheet when tapped
                            self.isDetailViewShowing = true
                            
                        }, label: {
                            
                            // recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
 
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            
                        })
                        .tag(index)
                        .sheet(isPresented: $isDetailViewShowing) {
                            // show Recipe Detail View
                            RecipeDetailView(recipe: model.recipes[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        
                    }
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
            //MARK: geo reader end
        
            //dynamic highlights for featured recipe
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
            
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    //capture the first selected index
    func setFeaturedIndex() {
        
        // Find the index of first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
