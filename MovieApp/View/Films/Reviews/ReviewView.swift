//
//  ReviewView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.colorScheme) var scheme
    
    let review: Review
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            VStack(alignment: .leading, spacing: 5){
                HStack(spacing: 10){
                    Image(review.reviewAuthorImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text(review.reviewAuthor)
                        .bold()
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                }
                .padding(.top, 10)
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading){
                    Text(review.reviewTitle)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .padding(.top, 24)
                    
                    Text(review.reviewDescription)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .padding(.top, 10)
                }.frame(width: size.width - 24)
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(review: Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                  reviewAuthor: "Arailym Bakenova",
                                  reviewAuthorImage: "user",
                                  reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.")
        ).preferredColorScheme(.dark)
    }
}
