//
//  APIMealsRepository.swift
//  Me4l
//
//  Created by Leonardo Viana on 28/04/21.
//

import Foundation

class APIMealsRepository: MealsRepository {
    func filterBy(firstLetter: String) -> [Meal] {
        let stringUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(firstLetter)"
        
        guard let url = URL(string: stringUrl),
              let data = try? Data(contentsOf: url) else { return []}
        
        if let result: APIMeals = try? JSONDecoder().decode(APIMeals.self, from: data) {
            var meals: [Meal] = []
            
            result.meals.forEach { meal in
                meals.append(
                    .init(
                        id: meal.idMeal,
                        name: meal.strMeal,
                        category: meal.strCategory,
                        instructions: meal.strInstructions,
                        thumb: meal.strMealThumb
                    )
                )
            }
            
            return meals
        } else {
            return []
        }
    }
}
