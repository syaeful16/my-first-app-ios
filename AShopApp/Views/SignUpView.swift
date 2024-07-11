//
//  SignUpView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 25/06/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct SignUpView: View {
    @State var emailID: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    
    // MARK: For error regis
    @State var showError: Bool = false
    @State var errorMsg: String = ""
    @State var isLoading: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                // MARK: Title Create Account
                VStack(alignment: .leading, spacing: 6) {
                    Text("Create Account")
                        .font(.system(size: 26, weight: .bold))
                    Text("Create account and get your product now.")
                        .font(.system(size: 16))
                        .foregroundStyle(.textGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                // MARK: Input Fullname
                InputFieldView(label: "Fullname", hint: "Enter your fullname", value: $loginViewModel.fullname)
                // MARK: Input Email Address
                InputFieldView(label: "Email Address", hint: "Enter your Email Address", value: $loginViewModel.email, textContentType: .emailAddress, keyboardType: .emailAddress)
                // MARK: Input Phone Number
                InputFieldView(label: "Phone Number", hint: "Enter your phone number", value: $loginViewModel.phone, textContentType: .telephoneNumber, keyboardType: .phonePad)
                // MARK: Input Password
                InputPassView(label: "Password", hint: "Password", value: $loginViewModel.password)
                
                Button(action: loginViewModel.register, label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .hAlign(.center)
                        .fillButton(.blue)
                })
                .padding(.top, 30)
                Spacer()
                HStack{
                    Text("Already have an Account?")
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Sign In")
                            .underline()
                            .bold()
                    })
                }
                .font(.subheadline)
            }
            .padding()
            .frame(height: .infinity, alignment: .top)
        }
        .scrollDismissesKeyboard(.interactively)
        .overlay(content: {
            LoadingView(show: $loginViewModel.isLoading)
        })
        
        // MARK: Display alert
        .alert("Error Register", isPresented: $loginViewModel.showError) {
            
        } message: {
            Text(loginViewModel.errorMsg)
        }
    }
}

#Preview {
    SignUpView()
}
