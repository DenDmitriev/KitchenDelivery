//
//  NetworkResponse.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation

@propertyWrapper public struct NetworkResponse<T: Decodable>: Decodable {

    public let wrappedValue: T?
    
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }
    
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
