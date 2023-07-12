//
//  OrderService.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

final class OrderService: ObservableObject {
    
    @Published var order: [Dish: Int] = [:]
    
    var total: Int {
        return order.reduce(0) { partialResult, item in
            partialResult + item.key.price * item.value
        }
    }
    
    func count(for dish: Dish) -> Int {
        guard let count = order[dish] else { return .zero }
        if count < .zero {
            order[dish] = .zero
        }
        return count
    }
    
    func add(product: Dish) {
        if let count = order[product] {
            order[product] = count + 1
        } else {
            order[product] = 1
        }
    }
    
    func remove(product: Dish) {
        guard let count = order[product] else { return }
        if count <= 1 {
            order.removeValue(forKey: product)
        } else {
            order[product] = count - 1
        }
    }
}
