//
//  MainTabView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject private var coordinator: MainTabCoordinator
    @ObservedObject private var viewModel: MainTabViewModel
    
    init() {
        viewModel = MainTabViewModel()
        coordinator = MainTabCoordinator()
    }
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            coordinator.menuView
                .environmentObject(coordinator.locationViewModel)
                .tabItem {
                    Label("Главная", image: "MainIcon")
                }
                .tag(MainTab.menu)
            
            coordinator.searchView
                .tabItem {
                    Label("Поиск", image: "SearchIcon")
                }
                .tag(MainTab.search)

            coordinator.basketView
                .environmentObject(coordinator.locationViewModel)
                .environmentObject(coordinator.orderService)
                .tabItem {
                    Label("Корзина", image: "BasketIcon")
                }
                .tag(MainTab.basket)

            coordinator.accountView
                .tabItem {
                    Label("Аккаунт", image: "AccountIcon")
                }
                .tag(MainTab.account)
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
