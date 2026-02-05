//
//  SampleProducts.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 27/01/2026.
//

import SwiftUI

struct Product: Identifiable, Equatable{
    
    let id = UUID()
    let name: String
    let price: Decimal
    let imageName: String
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: price as NSDecimalNumber) ?? "\(price)"
    }
    
}

let sampleProducts: [Product] = [
    Product(name: "Product 1", price: 19.99, imageName: "carrot.fill"),
    Product(name: "Product 2", price: 29.99, imageName: "tree.fill"),
    Product(name: "Product 3", price: 39.99, imageName: "atom"),
    Product(name: "Product 5", price: 59.99, imageName: "house.fill"),
    Product(name: "Product 6", price: 69.99, imageName: "star.fill"),
    Product(name: "Product 7", price: 79.99, imageName: "pencil.and.outline"),
    Product(name: "Product 8", price: 89.99, imageName: "person.fill"),
    Product(name: "Product4", price: 49.99, imageName: "book.fill")
]
