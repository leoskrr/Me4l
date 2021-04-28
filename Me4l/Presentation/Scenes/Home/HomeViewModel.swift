//
//  HomeViewModel.swift
//  Me4l
//
//  Created by Leonardo Viana on 28/04/21.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    enum ListMessage: String {
        case empty = "The meal list is empty"
        case notFound = "Could not find any meal"
    }
    
    @Published var searchBarText: String = ""
    @Published var listMessage: ListMessage = .empty
    @Published var meals: [Meal] = []
    
    private var mealsService: MealsService
    
    init(mealsService: MealsService) {
        self.mealsService = mealsService
        findMealsByLetter(letter: "")
    }
    
    func findMealsByLetter(letter: String){
        DispatchQueue.main.async {
            if self.searchBarText.count == 1 {
                let result: [Meal] = self.mealsService.filterByLetter(self.searchBarText)
                self.meals = result
            } else if self.searchBarText.count > 1 {
                self.listMessage = .notFound
                self.meals = []
            } else {
                self.listMessage = .empty
                self.meals = []
            }
        }
    }
}
