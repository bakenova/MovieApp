//
//  Privacy.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 02.05.2023.
//

import SwiftUI

struct Privacy: View {
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.ultraThinMaterial)
                        .frame(width: proxy.size.width - 40, height: proxy.size.height/2, alignment: .center)
                    Text("Licenses will be secured before we release our digital platform.")
                        .font(.title.bold())
                        .frame(width: proxy.size.width/2, height: proxy.size.height/2, alignment: .center)
                }.padding()
                Spacer()
            }
        }
    }
}

struct Privacy_Previews: PreviewProvider {
    static var previews: some View {
        Privacy().preferredColorScheme(.dark)
    }
}
