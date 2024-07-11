//
//  ProductItemView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import SwiftUI

struct ProductItemView: View {
    let productList: Product?
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: productList!.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(.all, 10)
                } placeholder: {
                    ProgressView()
                }
            }
            .frame(width: 160, height: 160, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
            )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(productList!.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.black)
                Text("$\(productList!.price, specifier: "%.1f")")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.bgSplash)
                
                RatingView(rate: productList!.rating.rate, count: productList!.rating.count)
                    .font(.caption2)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 290, alignment: .leading)
    }
}
