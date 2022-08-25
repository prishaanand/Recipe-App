//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Prisha Anand on 8/25/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    //dont want to create a new model here, otherwise it will be hard to keep both sets of data in sync
    //instead, want to have the same RecipeModel() instance powering both views
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
