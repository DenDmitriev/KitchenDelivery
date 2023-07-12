//
//  LocationAddressViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation

class LocationAddressViewModel: ObservableObject {
    
    let locationManager: LocationManager
    
    @Published var city: String?
    @Published var dateString: String?
    
    init() {
        locationManager = LocationManager()
        locationManager.lookUpCurrentLocation { placemark in
            self.city = placemark?.locality
        }
        dateString = dateFormatter()
    }
    
    private func dateFormatter() -> String {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "RU_ru")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}


