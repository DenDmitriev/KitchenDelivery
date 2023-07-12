//
//  NetworkError.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case network(description: String)
    case decodingError(description: String)
    case invalidResponse
    case unwrap
    
    var errorDescription: String? {
        switch self {
        case .network(description: let description):
            return description
        case .decodingError(description: let description):
            return description
        case .invalidResponse:
            return "Invalid response"
        case .unwrap:
            return "Force unwrap error"
        }
    }
}
