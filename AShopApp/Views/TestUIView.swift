//
//  TestUIView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import SwiftUI

struct TestUIView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            if let authData = loginViewModel.userData {
                Text(authData.fullname)
            } else {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            }
        }
    }
}

#Preview {
    TestUIView()
}
