//
//  MainViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

class MenuViewModel: ObservableObject {
    
    @Published var categories = [Category]()
    
    private var store = Set<AnyCancellable>()
    
    init() {
        fetchKitchens()
    }
    
    private func fetchKitchens() {
        guard let url = URLConfiguration.shared.categories()
        else {
            return
        }
        let networkService = NetworkService()
        networkService.getCategories(url: url)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { response in
                self.categories = response.сategories
            }
            .store(in: &store)
    }
}
