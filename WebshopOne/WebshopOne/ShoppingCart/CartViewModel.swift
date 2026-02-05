//
//  CartViewModel.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 04/02/2026.
//

import Foundation
import Combine

/// Holds the mutable cart state. Marked as `ObservableObject` so SwiftUI updates automatically.
final class CartViewModel: ObservableObject {

    /// Items currently in the cart. Each entry stores the product and a quantity.
    @Published private(set) var items: [CartItem] = []

    /// Represents a product + quantity pair.
    struct CartItem: Identifiable {
        let id = UUID()
        let product: Product
        var quantity: Int
    }

    // MARK: – Public API -----------------------------------------------------

    /// Add a product (or increase its quantity if already present).
    func add(_ product: Product, quantity: Int = 1) {
        guard quantity > 0 else { return }

        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
    }

    /// Remove a product completely.
    func remove(_ product: Product) {
        items.removeAll { $0.product.id == product.id }
    }

    /// Decrease quantity by one – removes the entry when it reaches zero.
    func decrement(_ product: Product) {
        guard let idx = items.firstIndex(where: { $0.product.id == product.id }) else { return }
        if items[idx].quantity > 1 {
            items[idx].quantity -= 1
        } else {
            items.remove(at: idx)
        }
    }

    /// Total price of everything in the cart.
    var total: Decimal {
        items.reduce(0) { $0 + ($1.product.price * Decimal($1.quantity)) }
    }

    /// Formatted total for UI.
    var formattedTotal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: total as NSDecimalNumber) ?? "\(total)"
    }

    // MARK: – Convenience ----------------------------------------------------

    /// Returns true when the cart is empty – handy for disabling checkout buttons.
    var isEmpty: Bool { items.isEmpty }
}
