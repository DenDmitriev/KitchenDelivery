//
//  WeightFormatter.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

struct WeightFormatter {
    
    static private let formatter: MassFormatter = {
        let formatter = MassFormatter()
        formatter.numberFormatter.locale = Locale.init(components: .init(identifier: "ru_RU"))
        formatter.unitStyle = .medium
        return formatter
    }()
    
    static func formatter(by mass: Double) -> String {
        let string = WeightFormatter.formatter.string(fromValue: mass, unit: .gram)
        return string
    }
}
