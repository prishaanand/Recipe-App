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
    
    //creates slidable cards for featured recipes
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
                
                TabView {
                    
                    // loop through recipes
                    ForEach (0..<model.recipes.count) { index in
                        
                        // show featured recipes
                        if model.recipes[index].featured == true {
                            
                            // Recipe card button
                            Button {
                                //show the recipe detail sheet when tapped
                                self.isDetailViewShowing = true
                            } label: {
                                
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
                                
                            }
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                //show recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            })
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
            
            //information for recipe
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
            
        }
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
