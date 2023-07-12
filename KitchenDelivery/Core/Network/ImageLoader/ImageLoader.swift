//
//  ImageLoader.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] image in
                self?.image = image
            })
    }
    
    func cancel() {
        cancellable?
            .cancel()
    }
}
