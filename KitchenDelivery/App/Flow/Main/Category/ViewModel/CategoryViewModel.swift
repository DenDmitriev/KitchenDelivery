//
//  CategoryViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import SwiftUI
import Combine

class CategoryViewModel: ObservableObject, Hashable {
    
    @Published var dishes = [Dish]()
    let category: Category
    private var store = Set<AnyCancellable>()
    
    init(category: Category) {
        self.category = category
        fetchDishes()
    }
    
    func showDish(coordinator: MainTabCoordinator, dish: Dish) {
        coordinator.popup = .product(dish: dish)
    }
    
    func getDish(by id: Int) -> Dish? {
        dishes.first(where: { $0.id == id }) ?? nil
    }
    
    func fetchDishes() {
        guard let url = URLConfiguration.shared.dishes()
        else { return }
        
        let networkService = NetworkService()
        networkService.getDishes(url: url)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    return
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { response in
                self.dishes = response.dishes
            }
            .store(in: &store)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(category.id)
    }
    
    static func == (lhs: CategoryViewModel, rhs: CategoryViewModel) -> Bool {
        lhs.category.id == rhs.category.id
    }
}
