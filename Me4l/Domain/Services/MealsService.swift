//
//  MealService.swift
//  Me4l
//
//  Created by Leonardo Viana on 28/04/21.
//

import Foundation

final class MealsService {
    var mealsRepository: MealsRepository
    
    init(repository: MealsRepository = APIMealsRepository()) {
        mealsRepository = repository
    }
    
    func filterByLetter(_ letter: String) -> [Meal] {
        return self.mealsRepository.filterBy(firstLetter: letter)
    }
}
