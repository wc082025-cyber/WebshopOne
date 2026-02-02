//
//  ProductCard.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 28/01/2026.
//

import SwiftUI

struct ProductCard : View {
    let product: Product
    
    var body: some View {
        VStack{
            Image(systemName: product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80) // image size
                .foregroundColor(Color.blue)
            
            Text(product.name)
                .font(Font.headline)
            
            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.yellow))
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}
