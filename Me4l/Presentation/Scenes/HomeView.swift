//
//  ContentView.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import SwiftUI
import URLImage

struct HomeView: View {
    @State private var searchBarText: String = ""
    private var mockMealsRepository: MockMealsRepository = .init()
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                SearchBar(text: $searchBarText, placeholder: "Type here...")
                    .padding(.horizontal, 10)

                VStack(alignment: .leading) {
                    ForEach(mockMealsRepository.getAll()) { meal in
                        if let mealThumb: String = meal.thumb {
                            if let mealThumbUrl: URL = URL(string: mealThumb) {
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
                                        Text(meal.name ?? "")
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
                        }
                    }
                }
                .padding(20)
            }
        }
        .navigationBarTitle("Home", displayMode: .automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
