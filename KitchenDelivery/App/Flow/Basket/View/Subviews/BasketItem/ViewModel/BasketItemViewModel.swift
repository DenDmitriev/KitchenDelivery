//
//  BasketItemViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 13.07.2023.
//

import Foundation

class BasketItemViewModel: ObservableObject {
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
}
