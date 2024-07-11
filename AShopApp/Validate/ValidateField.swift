//
//  ValidateField.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 26/06/24.
//

import Foundation

class ValidateField {
    public static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    public static func isValidNumber(_ input: String) -> Bool {
        let numberRegex = "^[0-9]+$"
        return NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: input)
    }
    
    // Function to validate if any field is empty
    static func isNotEmpty(_ fields: [String]) -> Bool {
        for field in fields {
            if field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return false
            }
        }
        return true
    }
}
