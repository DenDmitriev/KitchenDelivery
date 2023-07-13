//
//  TegsView.swift
//  KitchenDelivery
//
//  Created by Denis Dmitriev on 12.07.2023.
//

import SwiftUI

struct TegsView: View {
    
    @Binding var isSelected: Int
    let tags: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: GridApp.pt8) {
                ForEach(Array(zip(tags.indices, tags)), id: \.0) { index, tag in
                    Button {
                        isSelected = index
                    } label: {
                        Text(tag)
                            .font(CustomFont.title14)
                            .kerning(0.14)
                            .foregroundColor(index == isSelected ? .white : .primary)
                            .padding(.horizontal, GridApp.pt16)
                            .padding(.vertical, GridApp.pt10)
                            .background {
                                RoundedRectangle(cornerRadius: GridApp.cr10)
                                    .fill(index == isSelected ? Color.app.accentColor : Color.app.backgroundGray)
                            }
                    }
                }
            }
        }
    }
}

struct TegsView_Previews: PreviewProvider {
    static var previews: some View {
        TegsView(isSelected: Binding<Int>.constant(.zero),
                 tags: ["Все меню", "Салаты", "С рисом","С рыбой"])
    }
}
