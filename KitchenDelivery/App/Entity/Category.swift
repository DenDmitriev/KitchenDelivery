//
//  Category.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation

struct Category: Codable {
    static let tags: [String] = ["Все меню",
                                "Салаты",
                                "С рисом",
                                "С рыбой"]
    let id: Int
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
    }
}

extension Category {
    struct CategoriesResponse: Codable {
        let сategories: [Category]
    }
}
