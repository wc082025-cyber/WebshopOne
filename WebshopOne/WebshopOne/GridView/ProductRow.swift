//
//  ProductRow.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 28/01/2026.
//

import SwiftUI
struct ProductRow: View {
    let product: Product
    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        HStack {
            Image(systemName: product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)

            VStack(alignment: .leading) {
                Text(product.name).font(.headline)
                Text(product.formattedPrice)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button(action: { cart.add(product) }) {
                Image(systemName: "plus.circle")
                    .font(.title2)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.white))
                .stroke(Color.black.opacity(1.4),lineWidth: 3)
        )
    }
}
