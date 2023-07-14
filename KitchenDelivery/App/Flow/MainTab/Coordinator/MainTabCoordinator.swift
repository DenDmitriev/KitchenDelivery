//
//  MainTabCoordinator.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 13.07.2023.
//

import SwiftUI

enum MainTab {
    case menu
    case search
    case basket
    case account
}

enum Popup {
    case product(dish: Dish)
}

class MainTabCoordinator: ObservableObject {

    // MARK: Stored Properties

    @Published var tab = MainTab.menu
    @Published var popup: Popup? = nil
    
    @Published var menuViewModel = MenuViewModel()
    @Published var searchViewModel = SearchViewModel()
    @Published var basketViewModel = BasketViewModel()
    @Published var accountViewModel = AccountViewModel()
    @Published var locationViewModel = LocationAddressViewModel()

    let orderService: OrderService

    // MARK: Initialization

    init() {
        orderService = UserSession.shared.orderService
    }
    
    @ViewBuilder
    func buildTab(tab: MainTab) -> some View {
        switch tab {
        case .menu:
            MenuView(viewModel: menuViewModel)
                .environmentObject(self)
                .environmentObject(self.locationViewModel)
                .tabItem {
                    Label("Главная", image: "MainIcon")
                }
                .tag(tab)
                .overlay {
                    buildPopup()
                }
            
        case .search:
            SearchView(viewModel: searchViewModel)
                .tabItem {
                    Label("Поиск", image: "SearchIcon")
                }
                .tag(tab)
        case .basket:
            BasketView(viewModel: basketViewModel)
                .environmentObject(locationViewModel)
                .environmentObject(orderService)
                .tabItem {
                    Label("Корзина", image: "BasketIcon")
                }
                .tag(tab)
        case .account:
            AccountView(viewModel: accountViewModel)
                .tabItem {
                    Label("Аккаунт", image: "AccountIcon")
                }
                .tag(tab)
        }
    }
    
    @ViewBuilder
    func buildPopup() -> some View {
        switch popup {
        case .product(let dish):
            ZStack {
                Color.black.opacity(GridApp.part4)
                    .ignoresSafeArea()
                ProductView(showingDish: Binding<Bool>.init(get: {
                    self.popup != nil ? true : false
                }, set: { isShow in
                    self.popup = isShow ? .product(dish: dish) : nil
                }), dish: dish)
                .environmentObject(self)
                .padding(.horizontal, GridApp.pt16)
            }
        default:
            EmptyView()
        }
    }
}
