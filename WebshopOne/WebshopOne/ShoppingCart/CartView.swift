//
//  CartView.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 04/02/2026.
//

import SwiftUI

/// The main cart screen. Inject the shared view‑model via `environmentObject`.
struct CartView: View {

    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        NavigationStack {
            List {
                // ---------- List of items ----------
                ForEach(cart.items) { item in
                    HStack {
                        // Optional product image
                    

                        VStack(alignment: .leading) {
                            Text(item.product.name)
                                .font(.headline)
                            Text(item.product.formattedPrice)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        // Quantity controls
                        HStack(spacing: 8) {
                            Button("-") { cart.decrement(item.product) }
                                .buttonStyle(.borderedProminent)
                            Text("\(item.quantity)")
                                .frame(minWidth: 24)
                            Button("+") { cart.add(item.product) }
                                .buttonStyle(.borderedProminent)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .onDelete { indices in
                    // Swipe‑to‑delete support
                    indices.map { cart.items[$0].product }.forEach { cart.remove($0) }
                }

                // ---------- Total row ----------
                Section {
                    HStack {
                        Text("Total")
                            .font(.title2.bold())
                        Spacer()
                        Text(cart.formattedTotal)
                            .font(.title2.bold())
                    }
                }
            }
            .navigationTitle("Shopping Cart")
            .toolbar {
                // Optional “Clear” button
            /*    ToolbarItem(placement: .navigationBarTrailing) {
                    if !cart.isEmpty {
                        Button("Clear") {
                            $cart.clear
                        }
                    }
                }*/
            }
        }
    }
}
