//
//  CartRepositoryProtocol.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

// CONTRATO (Inversión de Dependencias para testing)
protocol CartRepositoryProtocol {
    func getCart() async throws -> [CartItem]
    func updateQuantity(itemId: String, quantity: Int) async throws -> CartItem
}
