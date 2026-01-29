//
//  ProductRow.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 28/01/2026.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View
    {
        HStack{
            Image(systemName: product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.yellow))
                .stroke(Color.gray.opacity(0.4))
        )
    }
}
