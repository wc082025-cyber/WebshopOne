//
//  ShoppingCart.swift
//  WebshopOne
//
//  Created by Chris Wahlberg on 04/02/2026.
//

import SwiftUI

struct ShoppingCart: View {
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        VStack {
            if cart.items.isEmpty {
                ContentUnavailableView("cart is empty",
                          systemImage: "cart",
                          description: Text("add items to your cart")
                )
            }else {
                List{
                    Section(header: Text("Items")){
                        ForEach(cart.items){ item in cartItemRow(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section{
                        HStack{
                            Text("Total")
                                .font(.headline)
                            Spacer()
                            Text(cart.formattedTotal)
                                .font(.title3)
                                .foregroundColor(.green)
                        }
                    }
                }
                //checkout
                Button(action: {
                    print("go to checkout \(cart.formattedTotal)")
                }) { Text("checkout")
                        .font(Font.title2.bold())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(20)
            }
        }
        .navigationTitle(Text("Shopping Cart"))
    }
    private func cartItemRow(item: CartViewModel.CartItem) -> some View {
        HStack{
            Image(systemName: item.product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading){
                Text(item.product.name)
                    .font(.body.bold())
                Text(item.product.formattedPrice)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            //quant step
            HStack(spacing: 12){
                Button(action: { cart.decrement(item.product) }){
                    Image(systemName: "minus.circle")
                }
                .buttonStyle(.plain)
                
                Text("\(item.quantity)")
                    .font(.body.monospacedDigit())
                
                Button(action: { cart.add(item.product)}){
                    Image(systemName: "plus.circle")
                }
                .buttonStyle(.plain)
                
            }
            .foregroundColor(.blue)
        }
        .padding(.vertical, 8)
    }
    private func deleteItems(at offsets: IndexSet){
        offsets.map { cart.items[$0].product} .forEach{
            product in cart.remove(product)
        }
    }
    
    
}

#Preview {
    let mockCart = CartViewModel()
    mockCart.add(sampleProducts[0])
    mockCart.add(sampleProducts[1], quantity: 2)
                 
                 return NavigationStack{
        ShoppingCart()
            .environmentObject(mockCart)
    }
}
