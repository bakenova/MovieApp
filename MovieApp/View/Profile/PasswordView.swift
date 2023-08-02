//
//  PasswordView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 02.05.2023.
//

import SwiftUI

struct PasswordView: View {
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @ObservedObject private var vm = UserManager()
    
    var body: some View {
        Image("ready")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView().preferredColorScheme(.dark)
    }
}
