//
//  UserSession.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

class UserSession {
    
    static let shared = UserSession()
    
    let orderService: OrderService
    
    private init () {
        orderService = OrderService()
    }
    
}
