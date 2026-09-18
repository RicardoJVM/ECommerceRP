//
//  CartItem.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

// DOMAIN MODEL: El objeto con el que trabaja la aplicación
struct CartItem: Identifiable, Equatable {
    let id: String
    let name: String
    let price: Double
    var quantity: Int
}
