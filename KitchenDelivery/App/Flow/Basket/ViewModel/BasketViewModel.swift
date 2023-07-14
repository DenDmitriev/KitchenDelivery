//
//  BasketViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation
import SwiftUI

class BasketViewModel: ObservableObject {

    func toPay() {
        print("Pay action")
    }
    
    func totalOrder(orderService: OrderService) -> String {
        CurrencyFormatter.formatter(by: Double(orderService.total))
    }
    
    func orderIsEmpty(orderService: OrderService) -> Bool {
        orderService.order
            .filter { $0.value != .zero }
            .count <= .zero
    }
}
