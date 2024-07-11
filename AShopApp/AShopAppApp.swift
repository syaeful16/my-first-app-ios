//
//  AShopAppApp.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI
import Firebase

@main
struct AShopAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

