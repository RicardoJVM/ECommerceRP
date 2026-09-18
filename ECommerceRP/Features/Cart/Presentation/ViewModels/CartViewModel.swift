//
//  CartViewModel.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class CartViewModel {
    // Propiedades mutables independientes (Sin struct State)
    var items: [CartItem] = []
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    private let repository: CartRepositoryProtocol
    
    init(repository: CartRepositoryProtocol? = nil) {
        self.repository = repository ?? CartRepository()
    }
    
    // Métodos directos por cada acción (Sin enum CartAction)
    func loadCart() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                self.items = try await repository.getCart()
                self.isLoading = false
            } catch {
                self.errorMessage = "Error al obtener el carrito."
                self.isLoading = false
            }
        }
    }
    
    func incrementQuantity(for item: CartItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].quantity += 1
        }
    }
    
    func decrementQuantity(for item: CartItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }
    
    func removeItem(id: String) {
        items.removeAll(where: { $0.id == id })
    }
}
