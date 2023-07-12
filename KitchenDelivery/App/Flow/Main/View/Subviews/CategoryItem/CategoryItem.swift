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
        CategoryItem(category: Category(id: .zero, name: "Пекарни и кондитерское", imageURL: "https://lh3.googleusercontent.com/fife/APg5EOYkl52vweri_LftXhwkPxs3KpAnuvGK3D47CgPX84NJtezEi8qE2GGEfYjDHG5QPlqP3a5NnlcoSw0o9XvRzkQytS3G20mqtirOga1ETYZuOFshsxGVH6P2UIr4ZeeCMTzniV6jE2JDbL2TrrEqwypyWLHsKU4IRUhIKeDetZ99n3gfPW9h1Uio67HCxmYPRuiYoZxH2wZ8xEec__-HxOwWvWhb1Yae3fYmmVWCSY7E75H2r-lXPk6NcpWn_zXRer1ksviJSLEiPBHngkGodpcYC4EwjVVYmsUFfeEZuS55w41JlXeLCaxbpMUNU4ThHPso7Cl-WrgBFKLECCXhGVNDPX66mcDu5EFC-vNGzLTfjoFcSOP3-qEr5HYvwC3l8ml8qdkBJ3jN9nyG9lfcLRjryQi-FkJqyhzZlL0o_UCCc0FIMepRfKGRDUaxNcGsYoLN9yjFhpcypA1yZbICt4DOfGLM-IK5RKlgZ23Au-jMxqtiAg-MBbtodtJlCUEaDGVhnF84W4iUyiL7now9wPzOfNS7fis89jgEot5sT-Q3FJy2T9RzBuh3R3KnGGyOx88tYtkpsZq4Sy-tWF_H8VfyaISYOBJx204XpEW0Z0mxuIqGN57Mku49Pzq_I7BvztHa_1Onq1jBWNcW1irtjfQWdzIwEz0se8zCq-aOp0CGp4neExmhfuh4LZ16Yb55IK6e2cMQj4AUahb1ze6jQJfRllZDdXwUNZMyErBswimfmuuoeF47gm2IvBGP2cbozdZLlBYwMQUbuiab96yA7rF__2ghfqyy5mI5CB5rnKgPPkMFw-fKFV7IvmPVk-Fb2K8DCBVQSeAY0njuvebCN18D_h10E0YRXmAwWFdhk0HWTVILUpF9COS-kbLmAzZ7zOY3ZW_5bA8chl3E8RZ1Vi-e1izPTRE2s4kH7SZvn9VepHita0Uhix-03hSHZFpxYC0eZP0tSaXaUUxmzNTAT8Q-ZyVIc3NMUtqu1ZIaC1Z6hDI4AqaM1Yxgf7whXYS9LfKfyvKSW8EBTmgCSBHdhaZuhiQwO9gcwkScCxbtwjjTx0cWEiAel95YVEFMluyHO5laNaVDRfS9t_VeIjO4B9eaBjK4TLLs2uywZEQUlW3RYraj53RjPA1Cu0SHJQGwtQ8TAU27RnsEdWk4MfpVXHpnpryOVK_SendFlLHygtfHskhx_dSzgrRZgwi_0jaTW0x7n0uNq_YVdFV6QwSDByrGBY3nrovIGvHTodQk-4hXyFIj6BtgVOA6ZyzbA3kJ0Fh-y0YE6-kHxKh-C54-YpshnpdmYqmZOci2AqxwJX1ueVCEPaJdrjqcZORS41Na6qmZFsWzBSve4__Zb6juB_MDxaenbNZsmT7_uQI4DDTGqgHA1h40-VfCEDYvJDIyoKrPj-WbvoQiJ_Ya3zFgZ9hB8LwxdAocpbIK3uQNIKwqhz9v6c4cs7AjKAqD5PTTod24iSSHyYdn5n1vjBQg_euJOexGY41IhOkGCCtAe94HHq-8MDve8bR8ffrsYyuO2b1EbPRfBsooHBG3mVMRa8gO9NGm0BtG-uslHUhLwWQewtqX_BlyWUYz5vD4Ke3AZnCh8tj5bBgcG2Z22qKcqbiTv40ADHBY5RdwbWhAiqO8DmLoteWJ=w1366-h617"))
            .previewLayout(.fixed(width: 343, height: 148))
    }
}
