//
//  SplashScreenView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 26/06/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            Text("ASHOP")
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    SplashScreenView()
}
