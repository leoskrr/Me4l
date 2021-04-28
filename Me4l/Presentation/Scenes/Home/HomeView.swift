//
//  ContentView.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import SwiftUI
import URLImage

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    init(model: HomeViewModel) {
        self.viewModel = model
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                SearchBar(text: $viewModel.searchBarText, placeholder: "Search here...")
                    .padding(.horizontal, 10)
                    .onChange(of: viewModel.searchBarText) { value in
                        viewModel.findMealsByLetter(letter: value)
                    }
                
                if(!viewModel.meals.isEmpty) {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.meals) { meal in
                            MealItemView(meal: meal)
                        }
                    }
                    .padding(20)
                } else {
                    Text(viewModel.listMessage.rawValue)
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(.init(UIColor.lightGray))
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - 100)
                }
                
            }
        }
        .navigationBarTitle("Home", displayMode: .automatic)
    }
}
