//
//  FilmDetails.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 29.04.2023.
//

import SwiftUI
import AVKit
import ExpandableText
import AVKit

struct FilmDetails: View {
    @State private var isPlaying = false
    @ObservedObject var viewModel: FilmDetailViewModel
    @Environment(\.colorScheme) var scheme
    @State private var isRatingFormPresented = false
    
    var film: Movie
    
    @State private var value = "positive"
    
    @State var reviewed: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            if isPlaying {
                VideoView(video: film)
                    .gesture(DragGesture().onChanged { _ in
                        isPlaying = false
                    })
            } else{
                ZStack{
                    // MARK: - Background
                    if let film = viewModel.film {
                        Image(film.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(15)
                            .frame(width: size.width, height: size.height)
                            .ignoresSafeArea()
                        
                        VisualEffectView(effect: UIBlurEffect(style: .dark))
                            .ignoresSafeArea()
                        
                        ScrollView{
                            VStack(spacing: 20) {
                                // MARK: - Image and rating
                                ZStack(alignment: .trailing) {
                                    Image(film.imageName)
                                        .resizable()
                                        .cornerRadius(15)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: size.height/2)
                                        .padding(.top, 45)
                                    
                                    ZStack (alignment: .center){
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: size.width/6, height: size.height/18, alignment: .trailing)
                                            .padding(.trailing, 24)
                                        //.blur(radius: 4)
                                            .foregroundColor(.white)
                                        
                                        HStack(alignment:.center, spacing: 5){
                                            Image("star")
                                                .resizable()
                                                .frame(width: 14, height: 14)
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundColor(.blue)
                                                .padding(.bottom, 2)
                                            Text("\(film.rating ?? 0.0, specifier: "%.1f")")
                                                .frame(alignment: .leading)
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                                .foregroundColor(.blue)
                                                .padding(.trailing, 24)
                                        }
                                    }
                                    
                                    //                            VideoPalyer(player: $player)
                                    //                                .background(Color.black.edgesIgnoringSafeArea(.all))
                                }
                                
                                // MARK: - Film Info
                                ZStack(alignment: .leading){
                                    Rectangle()
                                        .fill(self.scheme == .dark ? .black : .white.opacity(1))
                                        .opacity(self.scheme == .dark ? 0.9 : 1)
                                        .ignoresSafeArea()
                                        .padding(.top, -150)
                                    
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading) {
                                            Text(film.movieTitle)
                                                .frame(alignment: .leading)
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .padding(.top, -120)
                                                .padding(.bottom, 30)
                                                .padding(.leading, 24)
                                                .ignoresSafeArea()
                                            
                                            HStack{
                                                Text(film.releaseDate)
                                                    .frame(alignment: .leading)
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                    .padding(.top, -100)
                                                    .padding(.leading, 24)
                                                
                                                Text("|")
                                                    .frame(alignment: .leading)
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                    .padding(.top, -100)
                                                
                                                ZStack(alignment: .center){
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .frame(width: 36, height: 24, alignment: .trailing)
                                                        .padding(.top, -100)
                                                        .foregroundColor(.white)
                                                    Image(film.ageLimit)
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                        .aspectRatio(contentMode: .fit)
                                                        .padding(.top, -98)
                                                }
                                                
                                                Text("|")
                                                    .frame(alignment: .leading)
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                    .padding(.top, -100)
                                                
                                                Text(film.runtime + " mins")
                                                    .frame(alignment: .leading)
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                    .padding(.top, -100)
                                            }
                                            
                                            // MARK: - Play and Watch Later buttons
                                            Button {
                                                isPlaying = true
                                            } label: {
                                                //                                            NavigationLink(destination: VideoView(video: film)) {
                                                ButtonView(title: "Play", imageName: "play.fill", color: .blue, cornerRadius: 10, width: size.width-24, height: 40, fontSize: 20)
                                            }
                                            .foregroundColor(.white)
                                            .padding(.top, -60)
                                            .padding(.leading, 12)
                                            // }
                                            
                                            ButtonView(title: "Watch later", imageName: "bookmark.fill", color: .gray, cornerRadius: 10, width: size.width-24, height: 38, fontSize: 16)
                                                .padding(.top, -20)
                                                .padding(.leading, 12)
                                            
                                            // MARK: - Film Plot, Cast, Director
                                            Text(film.description)
                                                .frame(alignment: .leading)
                                                .font(.system(size: 16, weight: .regular))
                                                .padding(.top, 10)
                                                .padding(.horizontal, 20)
                                            
                                            ExpandableText(text: "Cast: " + film.cast)
                                                .lineLimit(1)
                                                .expandButton(TextSet(text: "more", font: .body, color: .blue))
                                                .collapseButton(TextSet(text: "less", font: .body, color: .blue))
                                                .foregroundColor(.gray)
                                                .frame(alignment: .leading)
                                                .font(.system(size: 16, weight: .regular))
                                                .padding(.top, 10)
                                                .padding(.horizontal, 20)
                                            
                                            Text("Director: " + film.director)
                                                .frame(alignment: .leading)
                                                .font(.system(size: 16, weight: .regular))
                                                .padding(.top, 10)
                                                .padding(.horizontal, 20)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        // MARK: - Korkem's Rating
                                        Text("Korkem's Rating")
                                            .frame(alignment: .leading)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        //.font(.system(size: 16, weight: .regular))
                                            .padding(.top, 10)
                                            .padding(.horizontal, 20)
                                        
                                        ZStack(alignment: .center){
                                            Rectangle()
                                                .fill(.thinMaterial)
                                                .frame(width: size.width - 24, height: size.height/4)
                                                .padding(.leading, 12)
                                            
                                            VStack{
                                                Text("\(film.rating ?? 0.0, specifier: "%.1f")")
                                                    .font(.system(size: 60, weight: .bold))
                                                    .foregroundColor(.blue)
                                                    .padding(.top, 15)
                                                    .padding(.horizontal, 20)
                                                
                                                Text(String(film.ratingCount) + " ratings")
                                                    .frame(alignment: .leading)
                                                    .font(.system(size: 16, weight: .regular))
                                                //.padding(.top, 10)
                                                    .padding(.horizontal, 20)
                                                    .foregroundColor(.gray)
                                                
                                                Button {
                                                    isRatingFormPresented = true
                                                } label: {
                                                    ButtonView(title: "Rate", imageName: "star.circle.fill", color: .blue, cornerRadius: 25, width: size.width/2, height: 48, fontSize: 24)
                                                }
                                                .foregroundColor(.white)
                                                .padding(.top, 10)
                                                .padding(.bottom, 25)
                                            }
                                        }
                                        
                                        
                                        // MARK: - Reviews
                                        VStack{
                                            HStack(){
                                                Text("Audience Reviews")
                                                    .font(.title3.bold())
                                                Spacer()
                                                NavigationLink(destination: ReviewList(viewModel: viewModel, film: film)) {
                                                    Text("See More")
                                                        .font(.system(size: 16, weight: .semibold))
                                                        .foregroundColor(.blue)
                                                }
                                            }
                                            .padding(.top, 20)
                                            .padding(.horizontal, 20)
                                            
                                            ScrollView(.horizontal, showsIndicators: false){
                                                HStack(alignment: .top, spacing: 12){
                                                    ForEach(film.reviews?.prefix(3) ?? [Review(
                                                        reviewTitle: "",
                                                        reviewAuthor: User(uid: "", username: "", email: "", firstName: "", lastName: "", phoneNumber: ""),
                                                        reviewDescription: "", reviewRate: "")]){ review in
                                                            NavigationLink(destination: ReviewView(review: review)) {
                                                                ZStack{
                                                                    RoundedRectangle(cornerRadius: 15)
                                                                        .fill(self.scheme == .dark ? .thinMaterial : .thickMaterial)
                                                                        .frame(width: size.width - 100,
                                                                               height: 150,
                                                                               alignment: .leading)
                                                                    
                                                                    VStack(alignment: .leading, spacing: 5){
                                                                        HStack(spacing: 8){
                                                                            Image("user")
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .frame(width: 20, height: 20)
                                                                                .padding(.leading, 10)
                                                                            
                                                                            Text(review.reviewAuthor.username ?? "")
                                                                                .bold()
                                                                                .font(.system(size: 16))
                                                                                .fontWeight(.bold)
                                                                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                                            
                                                                            Spacer()
                                                                            
                                                                            switch review.reviewRate {
                                                                            case "positive":
                                                                                Capsule()
                                                                                    .fill(Color.green)
                                                                                    .frame(width: 25, height: 10)
                                                                                    .padding(.trailing, 10)
                                                                            case "negative":
                                                                                Capsule()
                                                                                    .fill(Color.red)
                                                                                    .frame(width: 25, height: 10)
                                                                                    .padding(.trailing, 10)
                                                                            case "neutral":
                                                                                Capsule()
                                                                                    .fill(Color.gray)
                                                                                    .frame(width: 25, height: 10)
                                                                                    .padding(.trailing, 10)
                                                                            default:
                                                                                Capsule()
                                                                                    .fill(Color.gray)
                                                                                    .frame(width: 25, height: 10)
                                                                                    .padding(.trailing, 10)
                                                                            }
                                                                        }
                                                                        .padding(.top, 10)
                                                                        .padding(.horizontal, 8)
                                                                        
                                                                        Text(review.reviewTitle)
                                                                            .lineLimit(1)
                                                                            .frame(width: size.width - 150)
                                                                            .font(.system(size: 16, weight: .bold))
                                                                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                                            .padding(.top, 15)
                                                                            .padding(.horizontal, 10)
                                                                        Text(review.reviewDescription)
                                                                            .lineLimit(3)
                                                                            .frame(width: size.width - 150)
                                                                            .font(.system(size: 14, weight: .regular))
                                                                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                                            .multilineTextAlignment(.leading)
                                                                            .padding(.bottom, 10)
                                                                            .padding(.horizontal, 10)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                }
                                                .padding(.top, 0)
                                                .padding(.horizontal, 20)
                                                .padding(.bottom, 40)
                                            }
                                        }
                                        .opacity(reviewed ? 0 : 1)
                                        
                                        // MARK: - Film Criticism
                                        VStack{
                                            HStack(){
                                                Text("Film Criticism")
                                                    .font(.title3.bold())
                                                Spacer()
                                                NavigationLink(destination: FilmCriticismList(viewModel: viewModel, film: film)) {
                                                    Text("See More")
                                                        .font(.system(size: 16, weight: .semibold))
                                                        .foregroundColor(.blue)
                                                }
                                            }
                                            .padding(.horizontal, 20)
                                            
                                            ScrollView(.horizontal, showsIndicators: false){
                                                HStack(alignment: .top, spacing: 12){
                                                    ForEach(film.criticisms?.prefix(3) ?? [FilmCriticism(criticismTitle: "", criticismAuthor: User(uid: "", username: "", email: "", firstName: "", lastName: "", phoneNumber: ""), criticismDescription: "", actorRate: 0, directingRate: 0, soundRate: 0, scriptRate: 0)]){ crit in
                                                            NavigationLink(destination: FilmCriticismView(criticism: crit)) {
                                                                ZStack{
                                                                    RoundedRectangle(cornerRadius: 15)
                                                                        .fill(self.scheme == .dark ? .thinMaterial : .thickMaterial)
                                                                        .frame(width: size.width - 100,
                                                                               height: 200,
                                                                               alignment: .leading)

                                                                    VStack(alignment: .leading, spacing: 5){
                                                                        HStack(spacing: 8){
                                                                            Image("user")
                                                                                .resizable()
                                                                                .aspectRatio(contentMode: .fit)
                                                                                .frame(width: 20, height: 20)
                                                                                .padding(.leading, 10)

                                                                            Text(crit.criticismAuthor.username ?? "")
                                                                                .bold()
                                                                                .font(.system(size: 16))
                                                                                .fontWeight(.bold)
                                                                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)

                                                                            Spacer()
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
                                                                            .frame(width: size.width - 150)
                                                                            .font(.system(size: 16, weight: .bold))
                                                                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                                            .padding(.top, 15)
                                                                            .padding(.horizontal, 10)
                                                                        Text(crit.criticismDescription)
                                                                            .lineLimit(3)
                                                                            .frame(width: size.width - 150)
                                                                            .font(.system(size: 14, weight: .regular))
                                                                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                                                            .multilineTextAlignment(.leading)
                                                                            .padding(.bottom, 10)
                                                                            .padding(.horizontal, 10)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                }
                                                .padding(.top, 0)
                                                .padding(.horizontal, 20)
                                                .padding(.bottom, 40)
                                            }
                                        }
                                        //.opacity(reviewed ? 0 : 1)
                                    }
                                }
                            }
                        }
                        .toolbarBackground(.hidden, for: .navigationBar)
                        .scrollIndicators(.hidden)
                    }
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
        .onAppear {
            viewModel.fetchFilmDetails(for: film)
        }
        .sheet(isPresented: $isRatingFormPresented) {
            RatingView(film: film)
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct FilmDetails_Previews: PreviewProvider {
    static var previews: some View {
        let film =
        Movie(movieTitle: "Zhau zhurek myn bala",
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
                       reviewAuthor:
                        User(uid: "",
                             username: "kairatov",
                             email: "kairatovk@mail.ru",
                             firstName: "Kairat",
                             lastName: "Kairatov",
                             phoneNumber: "77777777777"),
                       reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                       reviewRate: "positive"),
                Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                       reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                       reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                       reviewRate: "neutral"),
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
              videoURL: "https://www.dropbox.com/s/60ogynxyne5eyig/ZXhATkf7.mp4?raw=1")
        
        let viewModel = FilmDetailViewModel()
        viewModel.reviews = film.reviews!
        return VStack {
            FilmDetails(viewModel: viewModel, film: film).preferredColorScheme(.dark)
        }
    }
}
