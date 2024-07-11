//
//  InputPassView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI

struct InputPassView: View {
    let label: String
    let hint: String
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(label)
                .font(.system(size: 14))
            SecureField(hint, text: $value)
                .textContentType(.password)
                .font(.system(size: 14))
                .borderField(1, .borderTextField, .bgTextField)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    InputPassView(label: "Password", hint: "Password", value: .constant("uhuyy cukuy"))
}
