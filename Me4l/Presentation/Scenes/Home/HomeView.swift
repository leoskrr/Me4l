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
                            if let mealThumb: String = meal.thumb {
                                if let mealThumbUrl: URL = URL(string: mealThumb) {
                                    NavigationLink(
                                        destination: MealView(imageUrl: mealThumbUrl, name: meal.name ?? "Unknown", instructions: meal.instructions ?? "No details"),
                                        label: {
                                            HStack {
                                                URLImage(url: mealThumbUrl) { image in
                                                    image
                                                        .resizable()
                                                        .frame(width: 120, height: 150)
                                                        .cornerRadius(15)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 15)
                                                                .stroke(lineWidth: 1)
                                                                .foregroundColor(.clear)
                                                                .shadow(color: .init(.darkGray), radius: 2, x: 0, y: 0)
                                                        )
                                                }
                                                
                                                VStack(alignment: .leading) {
                                                    Text(meal.name ?? "Unknown")
                                                        .font(.title2)
                                                        .fontWeight(.medium)
                                                    
                                                    Text(meal.category ?? "Unknown")
                                                        .font(.body)
                                                        .fontWeight(.regular)
                                                    
                                                    Text(meal.instructions ?? "No details")
                                                        .font(.body)
                                                        .fontWeight(.light)
                                                        .lineLimit(4)
                                                }
                                                .frame(height: 150, alignment: .top)
                                            }
                                        }
                                    )
                                    .foregroundColor(.black)
                                }
                            }
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
