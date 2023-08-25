//
//  MenuTypeCardView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct MenuTypeCardView: View {
    @Binding var selectedProductType: MenuModel.ProductType?
    let productType: MenuModel.ProductType
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedProductType = productType
            }
        }) {
            HStack(spacing: 0) {
                Image(productType.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                VStack{
                    Text(productType.inKorean)
                        .font(.system(size: 36, weight: .medium))
                        .foregroundColor(.black)
                    Text(productType.rawValue)
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 35)
            .padding(.vertical, 18)
            .frame(width: 273, height: 136, alignment: .leading)
            .background(selectedProductType == productType ? .white : .clear)
            .cornerRadius(24)
            .shadow(color: selectedProductType == productType  ? .black.opacity(0.15) : .black.opacity(0.01), radius: 8, x: 0, y: 4)
        }
        
    }
}

//struct MenuTypeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuTypeCardView(selectedProductType: .constant(true), productType: .snack)
//    }
//}
