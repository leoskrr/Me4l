//
//  MealRepository.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import Foundation

protocol MealsRepository {
    func filterBy(firstLetter: String) -> [Meal]
}
