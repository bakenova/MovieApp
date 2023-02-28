//
//  Music.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct Music: View {
    @State var currentTab: String = "Music"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    var body: some View {
        ZStack{
            VStack{
                Text("Music")
            }
        }
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music()
            .preferredColorScheme(.dark)
    }
}
