//
//  NetworkService.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getCategories(url: URL) -> AnyPublisher<Category.CategoriesResponse, NetworkError>
    func getDishes(url: URL) -> AnyPublisher<Dish.DishesResponse, NetworkError>
}

class NetworkService: NetworkServiceProtocol {
    func getCategories(url: URL) -> AnyPublisher<Category.CategoriesResponse, NetworkError> {
        URLSession.shared.publisher(for: url, queue: "CategoriesRequest")
    }
    
    func getDishes(url: URL) -> AnyPublisher<Dish.DishesResponse, NetworkError> {
        URLSession.shared.publisher(for: url, queue: "DishesRequest")
    }
}
