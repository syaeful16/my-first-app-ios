//
//  LoginView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    @State var showError: Bool = false
    @State var errorMsg: String = ""
    @State var isLoading: Bool = false
    
    // MARK: User local storage
    
    
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                // MARK: Title Sign IN
                VStack(alignment: .leading, spacing: 6) {
                    Text("Sign In")
                        .font(.system(size: 26, weight: .bold))
                    Text("Sign In and get your product now.")
                        .font(.system(size: 16))
                        .foregroundStyle(.textGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                // MARK: Input Email or Phone Number
                InputFieldView(label: "Email or Phone Number", hint: "Email or Phone Number", value: $loginViewModel.email, textContentType: .emailAddress, keyboardType: .emailAddress)
                // MARK: Input Password
                InputPassView(label: "Password", hint: "Password", value: $loginViewModel.password)
                
                Button(action: loginViewModel.login, label: {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .hAlign(.center)
                        .fillButton(.blue)
                })
                .padding(.top, 30)
                
                Spacer()
                
                HStack(spacing: 8){
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .underline()
                            .bold()
                    }
                }
                .font(.subheadline)
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(content: {
            LoadingView(show: $loginViewModel.isLoading)
        })
        
        // MARK: Display alert
        .alert("Error Login", isPresented: $loginViewModel.showError) {
            
        } message: {
            Text(loginViewModel.errorMsg)
        }
    }
    
//    func loginUser() {
//        isLoading = true
//        Task{
//            do {
//                try await Auth.auth().signIn(withEmail: emailID, password: password)
//                print("user found")
//                try await fetchUser()
//            } catch {
//                await setError(error)
//            }
//        }
//    }
    
//    func fetchUser() async throws{
//        guard let userID = Auth.auth().currentUser?.uid else {return}
//        let user = try await Firestore.firestore().collection("Users").document(userID).getDocument(as: User.self)
//        
//        // MARK: UI updating must be run on main thread
//        await MainActor.run(body: {
//            userUID = userID
//            userEmail = user.email
//            loginStatus = true
//        })
//    }
}

#Preview {
    LoginView()
}
