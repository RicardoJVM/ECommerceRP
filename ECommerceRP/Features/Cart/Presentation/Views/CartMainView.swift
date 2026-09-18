//
//  CartMainView.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation
import SwiftUI

struct CartMainView: View {
    @State private var viewModel = CartViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando carrito...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text(error).foregroundColor(.red)
                        Button("Reintentar") { viewModel.loadCart() }
                    }
                } else if viewModel.items.isEmpty {
                    ContentUnavailableView("Carrito Vacío", systemImage: "cart")
                } else {
                    List {
                        ForEach(viewModel.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name).font(.headline)
                                    Text("$\(item.price, specifier: "%.2f") c/u")
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                // Invocación directa de métodos
                                HStack(spacing: 12) {
                                    Button("-") { viewModel.decrementQuantity(for: item) }
                                        .buttonStyle(.bordered)
                                    
                                    Text("\(item.quantity)").bold()
                                    
                                    Button("+") { viewModel.incrementQuantity(for: item) }
                                        .buttonStyle(.bordered)
                                }
                                
                                Button(role: .destructive) {
                                    viewModel.removeItem(id: item.id)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Mi Carrito")
            .onAppear {
                viewModel.loadCart()
            }
        }
    }
}
