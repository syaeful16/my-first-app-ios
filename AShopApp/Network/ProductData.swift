//
//  ProductData.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import Foundation

class ProductData {
    static let shared = ProductData()
    
    private init() {}
    
    func fetchData() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("HTTP Status Code: \(httpResponse.statusCode)")
        }
        
        let decoder = JSONDecoder()
        let products = try decoder.decode([Product].self, from: data)
        
        print("Fetched Data: \(products)")
        
        return products
    }
}
