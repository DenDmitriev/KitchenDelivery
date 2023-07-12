//
//  OrderButtonViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

class OrderButtonViewModel: ObservableObject {
    
    func dishCount(in orderService: OrderService, for dish: Dish) -> Int {
        return orderService.count(for: dish)
    }
    
    func addToOrder(in orderService: OrderService, dish: Dish) {
        orderService.add(product: dish)
    }
    
    func removeFromOrder(in orderService: OrderService, dish: Dish) {
        orderService.remove(product: dish)
    }
}
