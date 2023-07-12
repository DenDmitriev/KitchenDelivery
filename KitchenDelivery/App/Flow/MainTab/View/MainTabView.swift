//
//  MainTabView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject private var viewModel: MainTabViewModel
    
    init() {
        self.viewModel = MainTabViewModel()
    }
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Главная", image: "MainIcon")
                }
            
            SearchView()
                .tabItem {
                    Label("Поиск", image: "SearchIcon")
                }

            BasketView()
                .tabItem {
                    Label("Корзина", image: "BasketIcon")
                }
                .environmentObject(UserSession.shared.orderService)

            AccountView()
                .tabItem {
                    Label("Аккаунт", image: "AccountIcon")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
