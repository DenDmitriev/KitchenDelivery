//
//  ProductModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 13.07.2023.
//

import Foundation

struct ProductModel {
    let name: String
    let price: String
    let weight: String
    let description: String
    let imageUrl: URL?
    
    static func makeModel(dish: Dish) -> ProductModel {
        return ProductModel(name: dish.name,
                            price: dish.priceFormatted(),
                            weight: dish.weightFormatted(),
                            description: dish.description,
                            imageUrl: URL(string: dish.imageUrl))
    }
}
