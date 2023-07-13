//
//  BasketItemModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 13.07.2023.
//

import Foundation

struct BasketItemModel {
    
    let name: String
    let price: String
    let weight: String
    let imageUrl: URL?
    
    
    static func makeModel(dish: Dish) -> BasketItemModel {
        return BasketItemModel(name: dish.name,
                               price: dish.priceFormatted(),
                               weight: dish.weightFormatted(),
                               imageUrl: URL(string: dish.imageUrl))
    }
}
