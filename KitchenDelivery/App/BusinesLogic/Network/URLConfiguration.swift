//
//  URLConfiguration.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation

class URLConfiguration {
    static let shared = URLConfiguration()
    
    static let host: String = "run.mocky.io"
    
    func categories() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = URLConfiguration.host
        components.path = "/v3/058729bd-1402-4578-88de-265481fd7d54"
        let url = components.url
        return url
    }
    
    func dishes() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = URLConfiguration.host
        components.path = "/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
        let url = components.url
        return url
    }
}
