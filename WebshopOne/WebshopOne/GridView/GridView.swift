//
//  GridView.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 28/01/2026.
//

import SwiftUI

struct GridView: View {
    let products: [Product]
    
    // below how many columns
    
    private let columns = [
        GridItem(.flexible(minimum: 100), spacing: 18),
        GridItem(.flexible(minimum: 100), spacing: 18),
        //GridItem(.flexible(), spacing: 18)
    
        ]
    
    var body: some View{
        
        
        
        ScrollView{LazyVGrid(columns: columns, spacing: 10){
            ForEach(products){product in
                ProductCard(product: product)
                    
                    .frame(height: 200)
            }
        }
        
        .padding()
        }
    }
}


