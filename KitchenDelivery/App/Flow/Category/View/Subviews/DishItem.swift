//
//  DishItem.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct DishItem: View {
    
    private let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: GridApp.pt6) {
                ZStack {
                    RoundedRectangle(cornerRadius: GridApp.cr10)
                        .fill(Color.app.backgroundImage)
                        .aspectRatio(1, contentMode: .fit)
                    
                    if let url = URL(string: dish.imageUrl) {
                        AsyncImage(url: url)
                            .padding(GridApp.pt10)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                
                Text(dish.name)
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
