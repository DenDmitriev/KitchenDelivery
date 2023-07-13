//
//  NetworkService.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getCategories(url: URL) -> AnyPublisher<Category.CategoriesResponse, NetworkServiceError>
    func getDishes(url: URL) -> AnyPublisher<Dish.DishesResponse, NetworkServiceError>
}

class NetworkService: NetworkServiceProtocol {
    func getCategories(url: URL) -> AnyPublisher<Category.CategoriesResponse, NetworkServiceError> {
        URLSession.shared.publisher(for: url, queue: "CategoriesRequest")
    }
    
    func getDishes(url: URL) -> AnyPublisher<Dish.DishesResponse, NetworkServiceError> {
        URLSession.shared.publisher(for: url, queue: "DishesRequest")
    }
}
