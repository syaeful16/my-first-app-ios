//
//  InputFieldView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI

struct InputFieldView: View {
    let label: String
    let hint: String
    @Binding var value: String
    var textContentType: UITextContentType?
    var keyboardType: UIKeyboardType?
    
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .font(.system(size: 14))
            TextField(hint, text: $value)
                .textContentType(textContentType ?? .none)
                .keyboardType(keyboardType ?? .default)
                .textInputAutocapitalization(.never)
                .contentMargins(.top, 8)
                .font(.system(size: 14))
                .borderField(1, .borderTextField, .bgTextField)
                .onChange(of: value) { oldState, newState in
                    validateValue(newState)
                }
            
            // MARK: Show error message
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func validateValue(_ value: String) {
        errorMessage = nil
        
        if value.isEmpty {
            errorMessage = "\(label) is required"
            return
        }
        
        if let textContentType = textContentType {
            switch textContentType {
            case .emailAddress:
                if !ValidateField.isValidEmail(value) {
                    errorMessage = "Invalid email format"
                }
            case .telephoneNumber:
                if !ValidateField.isValidNumber(value) {
                    errorMessage = "Invalid phone format"
                }
            default:
                break
            }
        }
    }
}

