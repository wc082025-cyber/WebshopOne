//
//  WebshopOneApp.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 20/01/2026.
//

import SwiftUI

@main
struct WebshopOneApp: App {
    @StateObject private var cart = CartViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(cart)
            
        }
    }
}
