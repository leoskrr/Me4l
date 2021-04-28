//
//  MockMealRepository.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import Foundation

class MockMealsRepository: MealsRepository {
    let meals: [Meal] = [
        .init(
            id: "1",
            name: "Macarronada",
            category: "Massa",
            instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis est interdum, dictum orci in, tincidunt ante. Aenean ullamcorper at mi vitae fringilla. Proin commodo ipsum vel sollicitudin faucibus",
            thumb: "https://img.imirante.com.br/2018/10/08/1539040260-451666479-810x471.jpg"
        ),
        .init(
            id: "2",
            name: "Yakissoba",
            category: "Chinesa",
            instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis est interdum, dictum orci in, tincidunt ante. Aenean ullamcorper at mi vitae fringilla. Proin commodo ipsum vel sollicitudin faucibus",
            thumb: "https://123foi.com.br//upload/produtos/142618.jpg"
        ),
    ]
    
    func filterBy(firstLetter: String) -> [Meal] {
        return meals
    }
}
