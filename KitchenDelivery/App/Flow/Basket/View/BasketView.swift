//
//  BasketView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct BasketView: View {
    
    @ObservedObject private var viewModel = BasketViewModel()
    @EnvironmentObject var orderService: OrderService
    @EnvironmentObject var locationViewModel: LocationAddressViewModel
    
    init(viewModel: BasketViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())]) {
                        ForEach(orderService.order
                            .filter { $0.value != .zero }
                            .sorted(by: >),
                                id: \.key) { (dish, count) in
                            BasketItem(dish: dish)
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal, GridApp.pt16)
                }
                
                Button {
                    viewModel.toPay()
                } label: {
                    ZStack {
                        Color.accentColor
                        
                        Text(viewModel.orderIsEmpty(orderService: orderService)
                             ? "Выберите блюдо в меню"
                             : "Оплатить \(viewModel.totalOrder(orderService: orderService))")
                            .font(Font.system(size: GridApp.pt16).weight(.medium))
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    }
                    .frame(height: GridApp.pt48)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(GridApp.cr10)
                    .padding(GridApp.pt16)
                }
                .disabled(viewModel.orderIsEmpty(orderService: orderService))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LocationAddressView(viewModel: locationViewModel)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image("account")
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(viewModel: BasketViewModel())
            .environmentObject(LocationAddressViewModel())
            .environmentObject({ () -> OrderService in
                let service = OrderService()
                service.order[MockData.dish] = 1
                return service
            }())
    }
}
