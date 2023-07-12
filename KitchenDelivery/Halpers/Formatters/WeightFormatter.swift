//
//  WeightFormatter.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

class WeightFormatter {
    
    static let shared = WeightFormatter()
    
    private init() {}
    
    static let formatter: MassFormatter = {
        let formatter = MassFormatter()
        formatter.numberFormatter.locale = Locale.init(components: .init(identifier: "ru_RU"))
        formatter.unitStyle = .medium
        return formatter
    }()
    
    func formatter(by mass: Double) -> String {
        let string = WeightFormatter.formatter.string(fromValue: mass, unit: .gram)
        return string
    }
}
