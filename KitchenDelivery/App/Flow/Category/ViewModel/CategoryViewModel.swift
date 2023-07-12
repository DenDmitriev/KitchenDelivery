//
//  CategoryViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

class CategoryViewModel: ObservableObject {
    
    @Published var dishes = [Dish]()
    let category: Category
    private var store = Set<AnyCancellable>()
    
    init(category: Category) {
        self.category = category
        fetchDishes()
    }
    
    private func fetchDishes() {
        guard let url = URLConfiguration.shared.dishes()
        else {
            return
        }
        let networkService = NetworkService()
        networkService.getDishes(url: url)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { response in
                self.dishes = response.dishes
            }
            .store(in: &store)
    }
}
