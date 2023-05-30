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
                switch review.reviewRate {
                case "positive":
                    Capsule()
                        .fill(Color.green)
                        .frame(width: size.width - 30, height: 10)
                        .padding(.top, 30)
                        .padding(.horizontal, 10)
                case "negative":
                    Capsule()
                        .fill(Color.red)
                        .frame(width: size.width - 30, height: 10)
                        .padding(.top, 30)
                        .padding(.horizontal, 10)
                case "neutral":
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: size.width - 30, height: 10)
                        .padding(.top, 30)
                        .padding(.horizontal, 10)
                default:
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: size.width - 30, height: 10)
                        .padding(.top, 30)
                        .padding(.horizontal, 10)
                }
                
                HStack(spacing: 10){
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text(review.reviewAuthor.username ?? "")
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
            //.padding(.top, -60)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(review: Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                  reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                  reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                  reviewRate: "positive")
        ).preferredColorScheme(.dark)
    }
}
