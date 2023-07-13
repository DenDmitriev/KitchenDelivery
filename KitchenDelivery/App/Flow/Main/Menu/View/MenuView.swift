//
//  MainView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject private var viewModel: MenuViewModel
    
    init() {
        self.viewModel = MenuViewModel()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(viewModel.categories, id: \.id) { category in
                        NavigationLink {
                            CategoryView(category: category)
                        } label: {
                            CategoryItem(category: category)
                                .padding(.horizontal, GridApp.pt16)
                        }
                    }
                }
                .padding(.top)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LocationAddressView()
                }

                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image("account")
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
