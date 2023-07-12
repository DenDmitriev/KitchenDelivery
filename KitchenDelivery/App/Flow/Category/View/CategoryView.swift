//
//  CategoryView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: CategoryViewModel
    @State private var isSelectedTag: Int = .zero
    @State private var showingDish: Bool = false
    @State private var selectedDish: Dish?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(category: Category) {
        self.viewModel = CategoryViewModel(category: category)
    }
    
    var body: some View {
        VStack(spacing: GridApp.pt16) {
            TegsView(isSelected: $isSelectedTag, tags: Category.tags)
                .padding(.leading, GridApp.pt16)
                .frame(height: GridApp.pt36)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: GridApp.pt8) {
                    ForEach(viewModel.dishes.filter({ dish in
                        dish.tags.contains(Category.tags[isSelectedTag])
                    }), id: \.id) { dish in
                        Button {
                            selectedDish = dish
                            showingDish.toggle()
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
                Image("account")
                    .clipShape(Circle())
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("back")
                        .accentColor(.primary)
                }
            }
        }.overlay {
            ZStack {
                if $showingDish.wrappedValue,
                   let dish = selectedDish {
                    Color.black.opacity(GridApp.part4)
                        .ignoresSafeArea()
                    ProductView(showingDish: $showingDish, dish: dish)
                        .padding(.horizontal, GridApp.pt16)
                }
            }
            .animation(.easeIn(duration: GridApp.part2), value: showingDish)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: MockData.category)
    }
}
