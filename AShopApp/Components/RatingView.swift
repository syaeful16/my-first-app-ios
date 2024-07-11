//
//  RatingView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import SwiftUI

struct RatingView: View {
    let rate: Double?
    let count: Int?
    
    var body: some View {
        HStack {
            HStack(spacing: 2) {
                ForEach(0 ..< 5, id: \.self) { star in
                    Image(systemName: star < Int(rate!.rounded()) ? "star.fill" : "star")
                        .foregroundStyle(.yellow)
                }
            }
            Spacer()
            HStack(spacing: 6) {
                Text("\(rate ?? 0, specifier: "%.2f")")
                    .foregroundStyle(.black)
                Text("(\(count ?? 0))")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    RatingView(rate: 42, count: 123)
}
