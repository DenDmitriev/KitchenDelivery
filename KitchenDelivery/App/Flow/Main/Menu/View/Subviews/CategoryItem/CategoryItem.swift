//
//  KitchenItemView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 11.07.2023.
//

import SwiftUI

struct CategoryItem: View {
    
    let category: Category
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                HStack {
                    VStack {
                        Text(category.name)
                            .multilineTextAlignment(.leading)
                            .font(CustomFont.titleMedium20)
                            .kerning(GridApp.part2)
                            .foregroundColor(.black)
                            .frame(maxWidth: proxy.size.width / 2, alignment: .leading)
                        Spacer()
                    }
                    .padding(.leading, GridApp.pt16)
                    .padding(.top, GridApp.pt12)
                    
                    Spacer()
                }
                
            }
            .zIndex(1)
            
            if let url = URL(string: category.imageURL) {
                AsyncImage(url: url)
                    .zIndex(0)
                    .aspectRatio(contentMode: .fit)
            }
            
        }
        .cornerRadius(GridApp.cr10)
    }
}

struct KitchenItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: MockData.category)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
