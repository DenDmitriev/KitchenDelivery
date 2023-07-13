//
//  OrderButtonViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

class OrderButtonViewModel: ObservableObject {
    
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    func dishCount(in orderService: OrderService) -> Int {
        return orderService.count(for: dish)
    }
    
    func addToOrder(in orderService: OrderService) {
        orderService.add(product: dish)
    }
    
    func removeFromOrder(in orderService: OrderService) {
        orderService.remove(product: dish)
    }
}
