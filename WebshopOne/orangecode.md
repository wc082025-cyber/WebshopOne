/*


//
//  ContentView.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 20/01/2026.
//

import SwiftUI

enum DisplayMode {
    case grid, list
}

struct ContentView: View {
    
    // MARK: – State
    
    @State private var mode: DisplayMode = .grid
    @State private var products = sampleProducts          // mutable copy we will sort
    @State private var sortedAscending = false
    
    // MARK: – Body
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.orange // changes light and dark mode
                    .ignoresSafeArea()
                // ── Header (your shell graphic) ──
                VStack {
                    Image(systemName: "fossil.shell.fill")
                        .position(x: 200, y: 50)
                        .font(.system(size: 70))
                        .background(
                            Color.gray.opacity(0.5)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame(width: 300, height: 100)
                                .position(x: 200, y: 50)
                        )
                    Spacer()
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .top)
                
                // ── Main shop UI ──
                VStack {
                    Text("Sample Shop")
                        .font(.title)
                        .bold()
                        .padding(.top, 10)
                    
                        .padding(100)
                    
                    // Switch between grid and list based on `mode`
                    if mode == .grid {
                        GridView(products: products)
                    } else {
                        ListView(products: products)
                    }
                    
                    // ── Bottom toolbar ──
                    VStack {
                        Spacer()
                        HStack {
                            //  Grid view button
                            Button(action: { mode = .grid }) {
                                Image(systemName: "square.grid.2x2")
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 10)
                                    .foregroundColor(mode == .grid ? .accentColor : .primary)
                            }
                            
                            // List view button
                            Button(action: { mode = .list }) {
                                Image(systemName: "rectangle.grid.1x3")
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 10)
                                    .foregroundColor(mode == .list ? .accentColor : .primary)
                            }
                            
                            // Sort button (price low → high)
                            Button(action: toggleSort) {
                                Image(systemName: "arrow.up.and.down.text.horizontal")
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 10)
                                    .foregroundColor(sortedAscending ? .accentColor : .primary)
                            }
                            
                            // Settings 
                            NavigationLink(destination: AccountSettings()) {
                                Image(systemName: "person.fill")
                                    .tint(Color.black)
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 10)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    // MARK: – Sorting helper
    
    private func toggleSort() {
        sortedAscending.toggle()
        if sortedAscending {
            // Sort the *state* array in‑place (cheapest → most expensive)
            products.sort { $0.price < $1.price }
        } else {
            // Restore the original order from the constant array
            products = sampleProducts
        }
    }
}

#Preview {
    ContentView()
}




*/
