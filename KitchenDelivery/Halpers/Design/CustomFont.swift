//
//  Font.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct CustomFont {
    static let title14 = Font.custom("SF Pro Display", size: 14)
    static let titleMedium16 = Font.custom("SF Pro Display", size: 16)
        .weight(.medium)
    static let titleMedium18 = Font.custom("SF Pro Display", size: 18)
        .weight(.medium)
    static let titleMedium20 = Font.custom("SF Pro Display", size: GridApp.pt20)
        .weight(.medium)
}
