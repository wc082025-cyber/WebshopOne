//
//  ProductCard.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 28/01/2026.
//

import SwiftUI

struct ProductCard : View {
    let product: Product
    
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        VStack{
            Image(systemName: product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 80) // image size
                .foregroundColor(Color.blue)
            
            Text(product.name)
                .font(Font.headline)
            
            Text(product.formattedPrice)
                .font(Font.subheadline)
            
            Button(action: {
                cart.add(product)
            }) {
               
                Text("Add")
                Image(systemName: "plus.circle")
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.white))
                .stroke(Color.black.opacity(1.3), lineWidth: 3)
        )
    }
}
#Preview {
    ProductCard(product: Product(name: "test", price: 10.00, imageName: "house"))
        .environmentObject(CartViewModel())
}
