//
//  MainViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

class MenuViewModel: ObservableObject {
    
    @Published var categoryViewModels = [CategoryViewModel]()
    
    private var store = Set<AnyCancellable>()
    
    init() {
    }
    
    func fetchKitchens() {
        guard let url = URLConfiguration.shared.categories()
        else { return }
        let networkService = NetworkService()
        networkService.getCategories(url: url)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    return
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { response in
                response.сategories.forEach {
                    self.categoryViewModels.append(CategoryViewModel(category: $0))
                }
            }
            .store(in: &store)
    }
}
