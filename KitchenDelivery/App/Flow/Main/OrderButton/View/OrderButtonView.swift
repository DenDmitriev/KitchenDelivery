//
//  OrderButtonView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

struct OrderButtonView: View {
    
    @EnvironmentObject var orderService: OrderService
    @ObservedObject private var viewModel: OrderButtonViewModel
    
    init(dish: Dish) {
        self.viewModel = OrderButtonViewModel(dish: dish)
    }

    var body: some View {
        VStack {
            if viewModel.dishCount(in: orderService) <= .zero {
                Button {
                    viewModel.addToOrder(in: orderService)
                } label: {
                    Text("Добавить в корзину")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            } else {
                HStack {
                    Button {
                        viewModel.removeFromOrder(in: orderService)
                    } label: {
                        Image("minus")
                            .padding(.leading, GridApp.pt6)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Text(viewModel.dishCount(in: orderService)
                        .formatted(.number))
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        viewModel.addToOrder(in: orderService)
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
