//
//  AuthViewModel.swift
//  Socialcademy
//
//  Created by Mirna Helmy on 3/3/22.
//

import Foundation
@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var email = ""
    @Published var password = ""
    
    private let authService = AuthService()
    
    init() {
        authService.$isAuthenticated.assign(to: &$isAuthenticated)
    }
    
    
    func signIn() {
        Task {
            do {
                try await authService.signIn(email: email, password: password)
            } catch {
                print("[AuthViewModel] Cannot sign in: \(error)")
            }
            
        }
    }
}

    extension AuthViewModel {
        class SignInViewModel: FormViewModel<(email: String, password: String)> {
            convenience init(action: @escaping Action) {
                self.init(initialValue: (email: "", password: ""), action: action)
            }
        }
     
        class CreateAccountViewModel: FormViewModel<(name: String, email: String, password: String)> {
            convenience init(action: @escaping Action) {
                self.init(initialValue: (name: "", email: "", password: ""), action: action)
            }
        }
    
    
    func makeSignInViewModel() -> SignInViewModel {
        return SignInViewModel(action: authService.signIn(email:password:))
    }
     
    func makeCreateAccountViewModel() -> CreateAccountViewModel {
        return CreateAccountViewModel(action: authService.createAccount(name:email:password:))
    }
    }
    

