//
//  LocationAddressView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct LocationAddressView: View {
    
    @ObservedObject var viewModel: LocationAddressViewModel
    
    init(viewModel: LocationAddressViewModel = LocationAddressViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: GridApp.pt4) {
            Image("locationMark")
            
            VStack(alignment: .leading, spacing: GridApp.pt4) {
                Text(viewModel.city ?? "")
                    .font(CustomFont.titleMedium18)
                    .foregroundColor(.primary)
                
                Text(viewModel.dateString ?? "")
                    .font(CustomFont.title14)
                    .kerning(0.14)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct LoactionAdressView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAddressView(viewModel: LocationAddressViewModel())
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
