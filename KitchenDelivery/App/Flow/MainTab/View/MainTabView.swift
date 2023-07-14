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
            coordinator.buildTab(tab: .menu)
            
            coordinator.buildTab(tab: .search)
            
            coordinator.buildTab(tab: .basket)
            
            coordinator.buildTab(tab: .account)
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
