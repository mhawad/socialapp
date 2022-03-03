//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Mirna Helmy on 2/28/22.
//

import SwiftUI
import Firebase


@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
