//
//  ContentView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    @StateObject var loginViewModel = LoginViewModel()
    var body: some View {
        if isAuthenticated {
            VStack {
                TabView{
                    StoreMainView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
            }
        } else {
            NavigationView {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
