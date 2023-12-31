//
//  MainView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel: MenuViewModel
    @EnvironmentObject var coordinator: MainTabCoordinator
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(viewModel.categoryViewModels, id: \.self) { viewModel in
                        NavigationLink {
                            CategoryView(viewModel: viewModel)
                                .environmentObject(coordinator)
                        } label: {
                            CategoryItem(category: viewModel.category)
                                .padding(.horizontal, GridApp.pt16)
                        }
                    }
                }
                .padding(.top)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LocationAddressView(viewModel: coordinator.locationViewModel)
                }

                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    AccountButton()
                        .environmentObject(coordinator)
                }
            }
        }
        .onAppear {
            viewModel.fetchKitchens()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel())
            .environmentObject(MainTabCoordinator())
    }
}
