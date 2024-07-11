//
//  User.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    var fullname: String
    var email: String
    var phoneNumber: String
    var password: String
    var userUID: String
    
    enum CodingKeys: CodingKey {
        case fullname
        case email
        case phoneNumber
        case password
        case userUID
    }
}

struct UserRes: Identifiable {
    var id: String
    var fullname: String
    var email: String
    var phoneNumber: String
}
