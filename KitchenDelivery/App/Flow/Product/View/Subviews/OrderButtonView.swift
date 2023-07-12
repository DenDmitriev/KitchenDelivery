//
//  OrderButtonView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

struct OrderButtonView: View {
    
    @EnvironmentObject var orderService: OrderService
    @ObservedObject private var viewModel = OrderButtonViewModel()
    let dish: Dish

    var body: some View {
        VStack {
            if viewModel.dishCount(in: orderService, for: dish) <= .zero {
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.addToOrder(in: orderService, dish: dish)
                    } label: {
                        Text("Добавить в корзину")
                            .frame(maxWidth: .infinity)
                    }
                }
            } else {
                HStack {
                    Button {
                        viewModel.removeFromOrder(in: orderService, dish: dish)
                    } label: {
                        Image("minus")
                            .padding(.leading, GridApp.pt6)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Text(viewModel.dishCount(in: orderService, for: dish)
                        .formatted(.number))
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        viewModel.addToOrder(in: orderService, dish: dish)
                    } label: {
                        Image("plus")
                            .padding(.trailing, GridApp.pt6)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .font(CustomFont.titleMedium16)
        .kerning(0.1)
        .frame(maxWidth: .infinity, maxHeight: GridApp.pt48, alignment: .center)
        
    }
}

struct OrderButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OrderButtonView(dish: MockData.dish)
            .environmentObject({ () -> OrderService in
                let service = OrderService()
                service.order[MockData.dish] = 1
                return service
            }())
            .previewLayout(.fixed(width: 100, height: 34))
    }
}
