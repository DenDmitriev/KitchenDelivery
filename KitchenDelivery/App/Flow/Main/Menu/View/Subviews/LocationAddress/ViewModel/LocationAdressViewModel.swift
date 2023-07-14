//
//  LocationAddressViewModel.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

class LocationAddressViewModel: ObservableObject {
    
    @Published var city: String?
    @Published var dateString: String?
    @Published var counter = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let locationManager: LocationManager
    private var store = Set<AnyCancellable>()
    
    init() {
        locationManager = LocationManager()
        getLocationWithTimer()
        getDate()
    }
    
    deinit {
        cancelTimer()
    }
    
    func getDate() {
        dateString = LocationAddressViewModel.dateToday()
    }
    
    func getLocation() {
        locationManager.lookUpCurrentLocation { placemark in
            DispatchQueue.main.async {
                guard let locality = placemark?.locality
                else { return }
                if self.city != locality {
                    self.city = locality
                }
            }
        }
        
        if locationManager.locationManager.authorizationStatus != .notDetermined {
            cancelTimer()
        }
    }
    
    private func getLocationWithTimer() {
        timer
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] timer in
                print(timer)
                self?.getLocation()
                self?.counter += 1
            })
            .store(in: &store)
    }
    
    private func cancelTimer() {
        timer.upstream.connect().cancel()
    }
    
    static private func dateToday() -> String {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "RU_ru")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}


