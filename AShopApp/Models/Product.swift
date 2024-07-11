//
//  Product.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import Foundation

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}

struct Product: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}
