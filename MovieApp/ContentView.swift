//
//  ContentView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

import SwiftUI

struct ContentView: View {
    @State private var isUserCurrentlyLoggedOut: Bool = false
    
    var body: some View {
        if self.isUserCurrentlyLoggedOut {
            Films(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
        }else {
            LoginRegister(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
