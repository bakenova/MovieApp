//
//  FilmCriticismList.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.05.2023.
//

import SwiftUI

struct FilmCriticismList: View {
    @ObservedObject var viewModel: FilmDetailViewModel
    @Environment(\.colorScheme) var scheme
    
    var film: Movie
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ScrollView{
                VStack(spacing: 20){
                    NavigationLink {
                        NewFilmCriticismView()
                    } label: {
                        ButtonView(title: "Add review", imageName: "pencil.line", color: .blue, cornerRadius: 25, width: size.width/2, height: 48, fontSize: 18)
                    }
                    .foregroundColor(.white)
                    .padding()

                    ForEach(film.criticisms!){ crit in
                        NavigationLink(destination: FilmCriticismView(criticism: crit)) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.thinMaterial)
                                    .frame(width: size.width - 20,
                                           height: 200,
                                           alignment: .leading)
                                
                                VStack(alignment: .leading, spacing: 5){
                                    HStack(spacing: 8){
                                        Image("user")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                        Text(crit.criticismAuthor.username ?? "")
                                            .bold()
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                    }
                                    .padding(.top, 10)
                                    .padding(.horizontal, 8)
                                    
                                    HStack{
                                        VStack(alignment: .leading){
                                            HStack{
                                                Text("Actor play:")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                Text("\(crit.actorRate)/10")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                            }
                                            HStack{
                                                Text("Directing:")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                Text("\(crit.directingRate)/10")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                            }
                                        }

                                        VStack(alignment: .leading){
                                            HStack{
                                                Text("Sound Engineering:")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                Text("\(crit.soundRate)/10")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                            }

                                            HStack{
                                                Text("Literecy of the script:")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                Text("\(crit.scriptRate)/10")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                            }
                                        }
                                    }
                                    .padding(.top, 16)
                                    .padding(.horizontal)

                                    Text(crit.criticismTitle)
                                        .lineLimit(1)
                                        .frame(width: size.width - 80)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                        .padding(.top, 15)
                                        .padding(.horizontal, 8)
                                    Text(crit.criticismDescription)
                                        .lineLimit(3)
                                        .frame(width: size.width - 80)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 15)
                                        .padding(.horizontal, 8)
                                }
                            }
                        }
                    }
                }
                .padding(.leading, 8)
            }
        }.navigationTitle(film.movieTitle)
            .onAppear {
                viewModel.fetchCriticisms(for: film)
            }
    }
}

struct FilmCriticismList_Previews: PreviewProvider {
    static var previews: some View {
        let film = Movie(movieTitle: "Zhau zhurek myn bala",
                         imageName: "Movie1",
                         genre: "Drama, Adventure, War, Historical",
                         collection: ["2010-2019"],
                         description: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                         cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov",
                         director: "Akan Satayev",
                         releaseDate: "2012",
                         ageLimit: "16",
                         runtime: "133",
                         rating: 8.0,
                         ratingCount: 7,
                         reviews: [
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "positive"),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "positive"),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "negative"),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "neutral")
                         ],
                         criticisms: [
                            FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7),
                            FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7)
                         ],
                         videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f")
        
        let viewModel = FilmDetailViewModel()
        viewModel.reviews = film.reviews!
        return VStack {
            FilmCriticismList(viewModel: viewModel, film: film).preferredColorScheme(.dark)
        }
    }
}
