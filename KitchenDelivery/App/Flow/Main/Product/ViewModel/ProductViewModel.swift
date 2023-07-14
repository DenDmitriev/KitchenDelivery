//
//  ProductViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    func dishInBasket(orderService: OrderService) -> Bool {
        guard let count = orderService.order[dish] else { return false }
        return count > .zero ? true : false
    }
}
