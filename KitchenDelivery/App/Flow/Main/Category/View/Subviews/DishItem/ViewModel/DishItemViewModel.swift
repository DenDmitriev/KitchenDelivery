//
//  DishItemViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

class DishItemViewModel: ObservableObject {
    
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
}
