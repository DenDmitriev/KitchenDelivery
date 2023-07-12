//
//  ProductViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    let session = UserSession.shared
    
    func addToOrder(dish: Dish) {
        session.orderService.add(product: dish)
    }
}
