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
                                 decoder: JSONDecoder = .init()) -> AnyPublisher<T, NetworkServiceError> {
        dataTaskPublisher(for: url)
            .receive(on: DispatchQueue(label: label, qos: .background, attributes: .concurrent))
            .map(\.data)
            .decode(type: NetworkResponse<T>.self, decoder: decoder)
            .mapError({ error -> NetworkServiceError in
                switch error {
                case is URLError:
                    return NetworkServiceError.network(description: error.localizedDescription)
                case is DecodingError:
                    return NetworkServiceError.decodingError(description: error.localizedDescription)
                default:
                    return NetworkServiceError.invalidResponse
                }
            })
            .flatMap({ response -> AnyPublisher<T, NetworkServiceError> in
                guard let value = response.wrappedValue else {
                    return Fail<T, NetworkServiceError>(error: NetworkServiceError.unwrap).eraseToAnyPublisher()
                }
                return Just(value)
                    .setFailureType(to: NetworkServiceError.self)
                    .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }
}
