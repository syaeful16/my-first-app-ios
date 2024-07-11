//
//  LoginView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 26/06/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var userData: UserRes?
    
    @Published var fullname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var phone: String = ""
    
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    @Published var isLoading: Bool = false
    
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    
    init() { fetchCurrentUser() }
    
    func login() {
        guard validateLogin() else {
            return
        }
        isLoading = true
        Task{
            do {
                try await Auth.auth().signIn(withEmail: email, password: password)
                await MainActor.run {
                    isAuthenticated = true
                }
                fetchCurrentUser()
                print(userData?.fullname ?? "gada")
            } catch {
                await setError(error)
            }
        }
    }
    
        func register() {
            guard validateRegis() else {
                return
            }
            isLoading = true
            Task{
                do {
                    // Step 1: Create new user
                    try await Auth.auth().createUser(withEmail: email, password: password)
                    // Step 2: Creating a User firestore object
                    guard let userUID = Auth.auth().currentUser?.uid else {return}
                    let user = User(fullname: self.fullname, email: self.email, phoneNumber: phone, password: self.password, userUID: userUID)
                    // Step3: Store User data to firestore
                    try Firestore.firestore().collection("Users").document(userUID).setData(from: user, completion: { error in
                        guard error == nil else {
                            return
                        }
                        
                        // MARK: Print saved successfully
                        print("Saved Successfully")
                        self.isAuthenticated = true
                    })
                } catch {
                    try await Auth.auth().currentUser?.delete()
                    await setError(error)
                }
            }
        }
    
    func logout() {
        Task{
            do {
                // logout account
                try Auth.auth().signOut()
                print("ke hit")
                await MainActor.run {
                    isAuthenticated = false
                }
            } catch {
                await setError(error)
            }
        }
    }
    
    func validateLogin() -> Bool {
        errorMsg = ""
        guard ValidateField.isNotEmpty([email, password]) else {
            showError = true
            errorMsg = "Please fill in all field"
            return false
        }
        
        guard ValidateField.isValidEmail(email) else {
            showError = true
            errorMsg = "Invalid format"
            return false
        }
        
        return true
    }
    
    func validateRegis() -> Bool {
        errorMsg = ""
        guard ValidateField.isNotEmpty([email, phone, password]) else {
            showError = true
            errorMsg = "Please fill in all field"
            return false
        }
        
        guard ValidateField.isValidEmail(email) else {
            showError = true
            errorMsg = "Invalid format"
            return false
        }
        
        return true
    }
    
    func fetchCurrentUser() {
        if let currentUser = Auth.auth().currentUser {
            print(currentUser.uid)
            let uid = currentUser.uid
            let db = Firestore.firestore()
            let docRef = db.collection("Users").document(uid)
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    print("exist")
                    let data = document.data()
                    print(data?["fullname"] as? String ?? "-")
                    self.userData = UserRes(
                        id: uid,
                        fullname: data?["fullname"] as? String ?? "-",
                        email: data?["email"] as? String ?? "-",
                        phoneNumber: data?["phoneNumber"] as? String ?? "-"
                    )
                    print(self.userData?.fullname ?? "apa ya")
                } else {
                    print("not found")
                    self.errorMsg = "Document does not exist"
                }
            }
        } else {
            print("errr")
            self.userData = nil
        }
    }
    
//    func fetchUser() {
//            guard let userID = Auth.auth().currentUser?.uid else {
//                print("Error: No user is logged in.")
//                return
//            }
//            
//            let db = Firestore.firestore()
//            db.collection("Users").document(userID).getDocument { [weak self] snapshot, error in
//                if let error = error {
//                    print("Error fetching user document: \(error.localizedDescription)")
//                    return
//                }
//                
//                guard let data = snapshot?.data() else {
//                    print("Error: No data found in the snapshot.")
//                    return
//                }
//                
//                print(data["userUID"] as? String ?? "")
//                
//                self?.currentUser = UserResponse(
//                    userUID: data["userUID"] as? String ?? "",
//                    email: data["email"] as? String ?? "",
//                    phoneNumber: data["phoneNumber"] as? String ?? ""
//                )
//                
//                // Print or log the current user to confirm the assignment
//                if let user = self?.currentUser {
//                    print("User fetched: \(user)")
//                }
//            }
//        }
    
    // MARK: Set Error Alert
    func setError(_ error: Error) async{
        await MainActor.run(body: {
            errorMsg = error.localizedDescription
            showError.toggle()
            isLoading = false
        })
    }
}
