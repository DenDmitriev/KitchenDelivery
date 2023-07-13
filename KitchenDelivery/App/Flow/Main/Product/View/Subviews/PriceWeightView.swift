//
//  PriceWeightView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 13.07.2023.
//

import SwiftUI

struct PriceWeightView: View {
    
    let price: String
    let weight: String
    
    var body: some View {
        HStack(spacing: .zero) {
            Text(price)
                .font(Font.system(size: GridApp.pt14))
            Text(" · ")
                .foregroundColor(.secondary)
            Text(weight)
                .foregroundColor(.secondary)
                
        }
    }
}

struct PriceWeightView_Previews: PreviewProvider {
    static var previews: some View {
        PriceWeightView(price: "99", weight: "250")
    }
}
