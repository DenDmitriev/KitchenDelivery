//
//  Dishes.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation

struct Dish: Codable, Hashable, Comparable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageUrl: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case weight
        case description
        case imageUrl = "image_url"
        case tags = "tegs"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Dish, rhs: Dish) -> Bool {
        lhs.id == rhs.id
    }
    
    static func < (lhs: Dish, rhs: Dish) -> Bool {
        lhs.name > rhs.name
    }
}

extension Dish {
    struct DishesResponse: Codable {
        let dishes: [Dish]
    }
}
