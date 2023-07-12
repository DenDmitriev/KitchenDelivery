//
//  ViewExtension.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

extension View {
    
    func popup<Content: View>(horizontalPadding: CGFloat = 40,
                              show: Binding<Bool>,
                              @ViewBuilder content: @escaping (() -> Content)) -> some View {
        return self
            .overlay {
                if show.wrappedValue {
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        NavigationView {
                            content()
                        }
                        .frame(width: size.width - horizontalPadding, height: .infinity, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
            }
    }
}
