//
//  CartRemoteDataSource.swift
//  ECommerceRP
//
//  Created by Ricardo Valencia on 18/9/26.
//

import Foundation

protocol CartRemoteDataSourceProtocol {
    func fetchCartItems() async throws -> [CartItemDTO]
}

final class CartRemoteDataSource: CartRemoteDataSourceProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchCartItems() async throws -> [CartItemDTO] {
        // En una app real se consulta a la API. Aquí simulamos el JSON decodificado:
        let dummyJSON = """
        [
            {"id": "1", "title": "AirPods Pro", "unitPrice": 249.99, "qty": 1},
            {"id": "2", "title": "Cargador USB-C", "unitPrice": 19.99, "qty": 2}
        ]
        """.data(using: .utf8)!
        
        return try JSONDecoder().decode([CartItemDTO].self, from: dummyJSON)
    }
}
