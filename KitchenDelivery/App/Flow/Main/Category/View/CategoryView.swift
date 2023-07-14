//
//  CategoryView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @EnvironmentObject var coordinator: MainTabCoordinator
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CategoryViewModel
    @State private var selectedTag: Int = .zero
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: GridApp.pt16) {
            TegsView(isSelected: $selectedTag, tags: Category.tags)
                .padding(.leading, GridApp.pt16)
                .frame(height: GridApp.pt36)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: GridApp.pt8) {
                    ForEach(viewModel.dishes.filter({ dish in
                        dish.tags.contains(Category.tags[selectedTag])
                    }), id: \.id) { dish in
                        Button {
                            viewModel.showDish(coordinator: coordinator, dish: dish)
                        } label: {
                            DishItem(dish: dish)
                        }
                    }
                }
                .padding(.horizontal, GridApp.pt16)
            }
        }
        .navigationTitle(viewModel.category.name)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                AccountButton()
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("back")
                        .accentColor(.primary)
                }
            }
        }
//        .overlay {
//            ZStack {
//                if $showingDish.wrappedValue,
//                   let dish = viewModel.getDish(by: selectedDishID) {
//                    Color.black.opacity(GridApp.part4)
//                        .ignoresSafeArea()
//                    ProductView(showingDish: $showingDish,
//                                dish: dish)
//                    .padding(.horizontal, GridApp.pt16)
//                }
//            }
//            .animation(.default, value: showingDish)
//        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: CategoryViewModel(category: MockData.category))
            .environmentObject(MainTabCoordinator())
    }
}
