//
//  Meal.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import Foundation

struct Meal {
    let idMeal: String
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strInstructions: String?
    let strMealThumb: String?

}

let meals: [Meal] = [
    .init(idMeal: "1",
          strMeal: "Macarronada",
          strDrinkAlternate: nil,
          strCategory: "Massa",
          strInstructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis est interdum, dictum orci in, tincidunt ante. Aenean ullamcorper at mi vitae fringilla. Proin commodo ipsum vel sollicitudin faucibus",
          strMealThumb: "https://img.imirante.com.br/2018/10/08/1539040260-451666479-810x471.jpg"),
    .init(idMeal: "2",
          strMeal: "Yakissoba",
          strDrinkAlternate: nil,
          strCategory: "Chinesa",
          strInstructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis est interdum, dictum orci in, tincidunt ante. Aenean ullamcorper at mi vitae fringilla. Proin commodo ipsum vel sollicitudin faucibus",
          strMealThumb: ""),
]
