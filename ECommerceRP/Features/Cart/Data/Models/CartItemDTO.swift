//
//  CartItemDTO.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

// DATA TRANSFER OBJECT (DTO): Mapea la respuesta JSON de la API
struct CartItemDTO: Decodable {
    let id: String
    let title: String
    let unitPrice: Double
    let qty: Int
    
    // Función para mapear a la Entidad de Dominio
    func toDomain() -> CartItem {
        CartItem(
            id: id,
            name: title,
            price: unitPrice,
            quantity: qty
        )
    }
}
