//
//  ListView.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 28/01/2026.
//

import SwiftUI

struct ListView: View {
    let products: [Product]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 12){
                ForEach(products) {sampleProduct in
                    ProductRow(product: sampleProduct)}
            }
        }
    }
}
