//
//  ProfileView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 8) {
                Group {
                    Rectangle()
                        .fill(.blue.opacity(0.1))
                        .frame(width: 120, height: 120)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                        .overlay(content: {
                            Text("SA")
                                .font(.system(size: 24))
                                .bold()
                                .foregroundStyle(.blue)
                        })
                }
                Text(loginViewModel.userData?.fullname ?? "-")
                    .font(.system(size: 22, weight: .bold))
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading) {
                    Text("General Information")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 12)
                    HStack(spacing: 10) {
                        Image(systemName: "person")
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .center)
                        Text(loginViewModel.userData?.fullname ?? "-")
                            .tint(.black)
                    }
                    .font(.system(size: 16))
                    .padding(.vertical, 6)
                    Divider()
                    HStack(spacing: 10) {
                        Image(systemName: "envelope")
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .center)
                        Text(loginViewModel.userData?.email ?? "-")
                            .tint(.black)
                    }
                    .font(.system(size: 16))
                    .padding(.vertical, 6)
                    Divider()
                    HStack(spacing: 10) {
                        Image(systemName: "iphone")
                            .symbolRenderingMode(.monochrome)
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .center)
                        Text(loginViewModel.userData?.phoneNumber ?? "-")
                            .foregroundStyle(.black)
                    }
                    .font(.system(size: 16))
                    .padding(.vertical, 6)
                }
                .padding(.all, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.borderTextField, lineWidth: 1)
                        )
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Button(action: loginViewModel.logout, label: {
                Text("Sign out")
                    .foregroundStyle(.blue)
                    .font(.system(size: 16, weight: .semibold))
                    .hAlign(.center)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous )
                            .fill(.black.opacity(0.05))
                    )
            })
            .padding(.top, 30)
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ProfileView()
}
