//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct MovieAppApp: App {
    @StateObject private var userManager = UserManager()
    @State private var isRegistrationPresented = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.colorScheme) var scheme
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
