//
//  DishItemModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

struct DishItemModel {
    let name: String
    let imageURL: URL?
    
    static func makeModel(dish: Dish) -> DishItemModel {
        return DishItemModel(name: dish.name, imageURL: URL(string: dish.imageUrl))
    }
}
