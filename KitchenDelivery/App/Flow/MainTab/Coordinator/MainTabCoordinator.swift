//
//  MainTabCoordinator.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 13.07.2023.
//

import Foundation

enum MainTab {
    case menu
    case search
    case basket
    case account
}

class MainTabCoordinator: ObservableObject {

    // MARK: Stored Properties

    @Published var tab = MainTab.menu
    
    var menuViewModel = MenuViewModel()
    var searchViewModel = SearchViewModel()
    var basketViewModel = BasketViewModel()
    var accountViewModel = AccountViewModel()
    var locationViewModel = LocationAddressViewModel()

    let orderService: OrderService

    // MARK: Initialization

    init() {
        orderService = UserSession.shared.orderService
    }
}
