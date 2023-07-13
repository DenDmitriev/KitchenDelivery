//
//  CurrencyFormatter.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import Foundation

struct CurrencyFormatter {
    
    static private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(components: .init(identifier: "ru_RU"))
        formatter.numberStyle = .currency
        formatter.currencyGroupingSeparator = " "
        formatter.minimumFractionDigits = .zero
        return formatter
    }()
    
    static func formatter(by price: Double) -> String {
        let string = CurrencyFormatter.formatter.string(for: price)
        return string ?? ""
    }
}
