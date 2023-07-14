//
//  ProductView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct ProductView: View {
    
    @EnvironmentObject var coordinator: MainTabCoordinator
    @ObservedObject private var viewModel: ProductViewModel
    @Binding var showingDish: Bool
    @StateObject var orderService: OrderService
    @State var isLiked: Bool = false
    let productModel: ProductModel
    
    init(showingDish: Binding<Bool>, dish: Dish) {
        self.viewModel = ProductViewModel(dish: dish)
        self._showingDish = showingDish
        _orderService = StateObject(wrappedValue: UserSession.shared.orderService)
        productModel = ProductModel.makeModel(dish: dish)
    }
    
    var body: some View {
        VStack(spacing: GridApp.pt8) {
            if let url = productModel.imageUrl {
                HStack(alignment: .center) {
                    Spacer()
                    
                    AsyncImage(url: url)
                        .scaledToFit()
                        .padding(.vertical, GridApp.pt14)
                    
                    Spacer()
                }
                .frame(height: GridApp.pt232)
                .background {
                    RoundedRectangle(cornerRadius: GridApp.cr10)
                        .fill(Color.app.backgroundImage)
                }
            }
            
            Text(productModel.name)
                .font(CustomFont.titleMedium16)
                .kerning(0.16)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            PriceWeightView(price: productModel.price, weight: productModel.weight)
                .font(CustomFont.title14)
                .kerning(0.14)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(productModel.description)
                .font(CustomFont.title14)
                .padding(.bottom, GridApp.pt4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary.opacity(0.65))
            
            HStack {
                OrderButtonView(dish: viewModel.dish)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(GridApp.cr10)
                    .environmentObject(orderService)
                
                if viewModel.dishInBasket(orderService: orderService) {
                    Button {
                        coordinator.tab = .basket
                    } label: {
                        Image("BasketIcon")
                            .padding(.horizontal)
                    }
                }
            }
        }
        .padding(GridApp.pt16)
        .overlay {
            ZStack(alignment: .topTrailing) {
                HStack {
                    Button {
                        isLiked.toggle()
                    } label: {
                        Image(isLiked ? "like.fill" : "like")
                            .padding(GridApp.pt10)
                            .background(.background)
                            .cornerRadius(GridApp.cr8)
                            .accentColor(isLiked ? .red : .primary)
                    }
                    
                    Button {
                        showingDish = false
                    } label: {
                        Image("xmark")
                            .padding(GridApp.pt10)
                            .background(.background)
                            .cornerRadius(GridApp.cr8)
                            .accentColor(.primary)
                    }
                }
            }
            .frame(height: GridApp.pt44)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding([.top, .trailing], 24)
        }
        .background(.background)
        .cornerRadius(GridApp.cr15)
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(showingDish: Binding<Bool>.constant(false),
                    dish: MockData.dish)
        .environmentObject(MainTabCoordinator())
    }
}
