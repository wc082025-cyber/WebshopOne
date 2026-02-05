//
//  ContentView.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 20/01/2026.
//

import SwiftUI

enum DisplayMode { case grid, list }

struct ContentView: View {
    
    // MARK: – State
    @StateObject private var cartViewModel = CartViewModel()
    
    @State private var mode: DisplayMode = .grid
    @State private var products = sampleProducts          // mutable copy
    @State private var sortedAscending = false
    
    // MARK: – Body
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white.opacity(0.5))
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    
                    // MARK: header
                    headerView
                        .frame(maxWidth: .infinity)   // stretch horizontally
                        .background(Color.clear)
                    
                    // MARK: scrollable product list
                    ScrollView {
                        VStack(spacing: 20) {
                            // Title
                            Text("Sample Shop")
                                .font(.title)
                                .bold()
                                .padding(.top, 10)
                            
                            // Grid or List, depending on mode
                            if mode == .grid {
                                GridView(products: products)
                            } else {
                                ListView(products: products)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    .layoutPriority(1)
                    
                    //MARK: bottom toolbar
                    
                    Spacer()
                    toolbarView
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                    
                    
                }
                .ignoresSafeArea(edges: .bottom)
            }
        
            
        }
        .environmentObject(cartViewModel)
      
    }
    
    // MARK: – Header view
    private var headerView: some View {
        VStack {
            Image(systemName: "fossil.shell.fill")
                .font(.system(size: 70))
                .frame(width: 300, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.blue.opacity(0.5)))
                        .stroke(Color.black.opacity(1.3), lineWidth: 3)
                )
            
            
                .padding(.top, 0)
        }
        
        
    }
    
    
    // MARK: – Toolbar
    
    private var toolbarView: some View {
        HStack (spacing: 20) {
            // Grid view button
            Button(action: { mode = .grid }) {
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: 40))
                    .foregroundColor(mode == .grid ? .accentColor : .primary)
            }
            
            // List view button
            Button(action: { mode = .list }) {
                Image(systemName: "rectangle.grid.1x3")
                    .font(.system(size: 40))
                    .foregroundColor(mode == .list ? .accentColor : .primary)
            }
            
            // Sort button
            Button(action: toggleSort) {
                Image(systemName: "arrow.up.and.down.text.horizontal")
                    .font(.system(size: 40))
                    .foregroundColor(sortedAscending ? .accentColor : .primary)
            }
            
            // Shopping cart link
            NavigationLink(destination: ShoppingCart()) {
                Image(systemName: "cart.fill")
                    .tint(Color.black)
                    .font(.system(size: 40))
                
            }
            
            // Settings link
            NavigationLink(destination: AccountSettings()) {
                Image(systemName: "person.fill")
                    .tint(Color.black)
                    .font(.system(size: 40))
                
            }
        
            
          
        }
        
        .padding()
    }
    
    // MARK: – Sorting helper
    private func toggleSort() {
        sortedAscending.toggle()
        if sortedAscending {
            products.sort { $0.price < $1.price }
        } else {
            products = sampleProducts
        }
    }
}

#Preview {
    ContentView()
}
