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
    @State private var mode: DisplayMode = .grid
    @State private var products = sampleProducts          // mutable copy
    @State private var sortedAscending = false
    
    // MARK: – Body
    var body: some View {
        NavigationStack {
                VStack(spacing: 0) {
                    
                    // ---------- HEADER ----------
                    headerView
                        .frame(maxWidth: .infinity)   // stretch horizontally
                        .background(Color.clear)
                    
                    // ---------- SCROLLABLE PRODUCT LIST ----------
                    // The key line is the `frame(maxHeight: .infinity)` – it tells
                    // the ScrollView: “take **all** the vertical space that’s left”.
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
                    
                    // ---------- BOTTOM TOOLBAR (sticky) ----------
                
                    Spacer()
                    toolbarView
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                    
                        
                }
                .ignoresSafeArea(edges: .bottom)
        
            
        }
        
      
    }
    
    // MARK: – Header view (simple static graphic)
    private var headerView: some View {
        VStack {
            Image(systemName: "fossil.shell.fill")
                .font(.system(size: 70))
                .frame(width: 300, height: 100)
                .background(
                    Color.gray.opacity(0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                )
                .padding(.top, 0)               // tiny gap from the status bar
        }
        
    }
    
    
    // MARK: – Toolbar (buttons + settings link)
    
    private var toolbarView: some View {
        HStack (spacing: 30) {
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
            
            // Settings link
            NavigationLink(destination: AccountSettings()) {
                Image(systemName: "person.fill")
                    .tint(Color.black)
                    .font(.system(size: 40))
                
            }
          
        }
        
        .padding()
       // .padding(.bottom)
       // .background(Color(UIColor.secondarySystemBackground))
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
