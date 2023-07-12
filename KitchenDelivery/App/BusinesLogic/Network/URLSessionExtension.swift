//
//  URLSessionExtension.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine

extension URLSession {
    func publisher<T: Decodable>(for url: URL,
                                 queue label: String,
                                 responseType: T.Type = T.self,
                                 decoder: JSONDecoder = .init()) -> AnyPublisher<T, NetworkError> {
        dataTaskPublisher(for: url)
            .receive(on: DispatchQueue(label: label, qos: .background, attributes: .concurrent))
            .map(\.data)
            .decode(type: NetworkResponse<T>.self, decoder: decoder)
            .mapError({ error -> NetworkError in
                switch error {
                case is URLError:
                    return NetworkError.network(description: error.localizedDescription)
                case is DecodingError:
                    return NetworkError.decodingError(description: error.localizedDescription)
                default:
                    return NetworkError.invalidResponse
                }
            })
            .flatMap({ response -> AnyPublisher<T, NetworkError> in
                guard let value = response.wrappedValue else {
                    return Fail<T, NetworkError>(error: NetworkError.unwrap).eraseToAnyPublisher()
                }
                return Just(value)
                    .setFailureType(to: NetworkError.self)
                    .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }
}
