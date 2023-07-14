//
//  AccountButton.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 14.07.2023.
//

import SwiftUI

struct AccountButton: View {
    
    @EnvironmentObject var coordinator: MainTabCoordinator
    
    var body: some View {
        Button {
            coordinator.tab = .account
        } label: {
            Image("account")
                .clipShape(Circle())
        }
    }
}

struct AccountButton_Previews: PreviewProvider {
    static var previews: some View {
        AccountButton()
            .environmentObject(MainTabCoordinator())
    }
}
