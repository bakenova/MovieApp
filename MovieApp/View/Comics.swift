//
//  Comics.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct Comics: View {
    @State var currentTab: String = "Comics"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    var body: some View {
        
        ZStack{
            VStack{
                NavBar(currentTab: self.$currentTab)
                Text("Comics")
            }
        }
        
    }
}

struct Comics_Previews: PreviewProvider {
    static var previews: some View {
        Comics()
            .preferredColorScheme(.dark)
    }
}
