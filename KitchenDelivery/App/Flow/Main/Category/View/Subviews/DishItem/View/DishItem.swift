//
//  DishItem.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct DishItem: View {
    
    @ObservedObject private var viewModel: DishItemViewModel
    private let dishModel: DishItemModel
    
    init(dish: Dish) {
        dishModel = DishItemModel.makeModel(dish: dish)
        viewModel = DishItemViewModel(dish: dish)
        
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: GridApp.pt6) {
                ZStack {
                    RoundedRectangle(cornerRadius: GridApp.cr10)
                        .fill(Color.app.backgroundImage)
                        .aspectRatio(1, contentMode: .fit)
                    
                    if let url = dishModel.imageURL {
                        AsyncImage(url: url)
                            .padding(GridApp.pt10)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                
                Text(dishModel.name)
                    .font(CustomFont.title14)
                    .kerning(0.14)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
    }
}

struct DishItem_Previews: PreviewProvider {
    static var previews: some View {
        DishItem(dish: MockData.dish)
            .previewLayout(.fixed(width: 200, height: 300))
    }
}
