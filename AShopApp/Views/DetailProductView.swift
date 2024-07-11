//
//  DetailProductView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import SwiftUI

struct DetailProductView: View {
    var productData: Product?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: productData!.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .blendMode(.multiply)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: 300, alignment: .center)
                    .background(.gray.opacity(0.05))
                    
                    VStack(alignment: .leading) {
                        HStack {
                            ZStack {
                                Text(productData!.category)
                                    .font(.footnote)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.blue.opacity(0.1))
                            )
                            Spacer()
                            Text("$\(productData!.price, specifier: "%.2f")")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.blue)
                        }
                        
                        Text(productData!.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                        
                        RatingView(rate: 3.5, count: 123)
                            .font(.callout)
                        
                        Text(productData!.description)
                            .font(.callout)
                            .padding(.top)
                    }
                    .padding()
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            
            HStack(spacing: 20) {
                // Button with system symbol (SF Symbols)
                Button(action: {}, label: {
                    Text("Buy Now")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .hAlign(.center)
                        .fillButton(.blue)
                })

                Button(action: {}, label: {
                    Image(systemName: "cart")
                        .foregroundStyle(.blue)
                        .font(.system(size: 16))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 5, style: .continuous )
                                .fill(.white)
                                .stroke(.blue, lineWidth: 1)
                        )
                })
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    DetailProductView()
}
