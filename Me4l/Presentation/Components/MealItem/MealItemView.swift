//
//  MealItemView.swift
//  Me4l
//
//  Created by Leonardo Viana on 28/04/21.
//

import SwiftUI
import URLImage

struct MealItemView: View {
    let meal: Meal
    
    var body: some View {
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
