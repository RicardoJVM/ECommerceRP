//
//  CartRepository.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

// IMPLEMENTACIÓN
final class CartRepository: CartRepositoryProtocol {
    private let remoteDataSource: CartRemoteDataSourceProtocol
    
    init(remoteDataSource: CartRemoteDataSourceProtocol = CartRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getCart() async throws -> [CartItem] {
        // 1. Obtiene DTOs de la red
        let dtos = try await remoteDataSource.fetchCartItems()
        // 2. Transforma los DTOs a entidades de Dominio
        return dtos.map { $0.toDomain() }
    }
    
    func updateQuantity(itemId: String, quantity: Int) async throws -> CartItem {
        // Simulación de actualización remota
        return CartItem(id: itemId, name: "Producto Actualizado", price: 100.0, quantity: quantity)
    }
}
