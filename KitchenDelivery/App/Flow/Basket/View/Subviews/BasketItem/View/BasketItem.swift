//
//  BasketItem.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

struct BasketItem: View {
    
    @EnvironmentObject var orderService: OrderService
    @ObservedObject private var viewModel: BasketItemViewModel
    let dishModel: BasketItemModel
    
    init(dish:Dish) {
        viewModel = BasketItemViewModel(dish: dish)
        dishModel = BasketItemModel.makeModel(dish: dish)
    }
    
    var body: some View {
        HStack(spacing: GridApp.pt8) {
            ZStack {
                RoundedRectangle(cornerRadius: GridApp.cr10)
                    .fill(Color.app.backgroundImage)
                    .aspectRatio(1, contentMode: .fit)
                
                if let url = dishModel.imageUrl {
                    AsyncImage(url: url)
                        .padding(GridApp.pt4)
                        .aspectRatio(contentMode: .fit)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            VStack {
                Text(dishModel.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                PriceWeightView(price: dishModel.price, weight: dishModel.weight)
                    .font(CustomFont.title14)
                    .kerning(0.14)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            OrderButtonView(dish: viewModel.dish)
                .frame(width: GridApp.pt100, height: GridApp.pt32)
                .foregroundColor(.primary)
                .background(Color.app.grayFirst)
                .cornerRadius(GridApp.cr10)
                .environmentObject(orderService)
        }
        .frame(height: GridApp.pt64)
    }
}

struct BasketItem_Previews: PreviewProvider {
    static var previews: some View {
        BasketItem(dish: MockData.dish)
            .environmentObject(OrderService())
    }
}
