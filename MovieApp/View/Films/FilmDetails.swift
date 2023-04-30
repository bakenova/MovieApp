//
//  FilmDetails.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 29.04.2023.
//

import SwiftUI
import AVKit
import ExpandableText

struct FilmDetails: View {
    
    var film: Movie
    var reviewed: Bool = false
//    @State var player = AVPlayer(url: URL(string: "")!)
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            ZStack{
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
                        ZStack(alignment: .trailing) {
                            Image(film.imageName)
                                .resizable()
                                .cornerRadius(15)
                                .aspectRatio(contentMode: .fill)
                                .frame(height: size.height/2)
                            
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
                                        .padding(.bottom, 2)
                                    Text(String(film.rating))
                                        .frame(alignment: .leading)
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(.orange)
                                        .padding(.trailing, 24)
                                }
                            }
                                
//                            VideoPalyer(player: $player)
//                                .background(Color.black.edgesIgnoringSafeArea(.all))
                        }
                        
                        ZStack(alignment: .leading){
                            Rectangle()
                                .fill(self.scheme == .dark ? .black : .yellow.opacity(0.2))
                                .opacity(self.scheme == .dark ? 0.9 : 1)
                                .ignoresSafeArea()
                                .padding(.top, -150)

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
                                    
                                    Text(film.runtime)
                                        .frame(alignment: .leading)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .padding(.top, -100)
                                }
                                
                                ButtonView(title: "Play", imageName: "play.fill", color: .orange, cornerRadius: 10, width: size.width-24, height: 40, fontSize: 20)
                                    .padding(.top, -60)
                                    .padding(.leading, 12)
                                
                                ButtonView(title: "Watch later", imageName: "bookmark.fill", color: .gray, cornerRadius: 10, width: size.width-24, height: 38, fontSize: 16)
                                    .padding(.top, -20)
                                    .padding(.leading, 12)
                                
                                Text(film.description)
                                    .frame(alignment: .leading)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(.top, 10)
                                    .padding(.horizontal, 20)
                                
                                ExpandableText(text: "Cast: " + film.cast)
                                    .lineLimit(1)
                                    .expandButton(TextSet(text: "more", font: .body, color: .orange))
                                    .collapseButton(TextSet(text: "less", font: .body, color: .orange))
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
                                        Text(String(film.rating))
                                            .font(.system(size: 60, weight: .bold))
                                            .foregroundColor(.orange)
                                            .padding(.top, 15)
                                            .padding(.horizontal, 20)
                                        
                                        Text(String(film.ratingCount*10000 + 232) + " ratings")
                                            .frame(alignment: .leading)
                                            .font(.system(size: 16, weight: .regular))
                                        //.padding(.top, 10)
                                            .padding(.horizontal, 20)
                                            .foregroundColor(.gray)
                                        
                                        ButtonView(title: "Rate", imageName: "star.circle.fill", color: .orange, cornerRadius: 25, width: size.width/2, height: 48, fontSize: 24)
                                            .padding(.top, 10)
                                            .padding(.bottom, 25)
                                    }
                                }
                                
                                VStack{
                                    HStack(){
                                        Text("Reviews")
                                            .font(.title3.bold())
                                        Spacer()
                                        Button("See More"){}
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.orange)
                                    }
                                    .padding(.top, 20)
                                    .padding(.horizontal, 20)
                                    
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack(alignment: .top, spacing: 12){
                                            ForEach(film.reviews?.prefix(3) ?? [Review(
                                                reviewTitle: "",
                                                reviewAuthor: "",
                                                reviewAuthorImage: "",
                                                reviewDescription: "")]){ review in
                                                NavigationLink(destination: ReviewView()) {
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 15)
                                                            .fill(.thinMaterial)
                                                            .frame(width: size.width - 100,
                                                                   height: 150,
                                                                   alignment: .leading)
                                                        
                                                        VStack(alignment: .leading, spacing: 5){
                                                            HStack(spacing: 8){
                                                                Image(review.reviewAuthorImage)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: 20, height: 20)
                                                                Text(review.reviewAuthor)
                                                                    .bold()
                                                                    .font(.system(size: 16))
                                                                    .fontWeight(.bold)
                                                                    .foregroundColor(.white)
                                                            }
                                                            .padding(.top, 10)
                                                            .padding(.horizontal, 8)
                                                            
                                                            Text(review.reviewTitle)
                                                                .lineLimit(1)
                                                                .frame(width: size.width - 150)
                                                                .font(.system(size: 16, weight: .bold))
                                                                .foregroundColor(.white)
                                                                .padding(.top, 15)
                                                                .padding(.horizontal, 8)
                                                            Text(review.reviewDescription)
                                                                .lineLimit(3)
                                                                .frame(width: size.width - 150)
                                                                .font(.system(size: 14, weight: .regular))
                                                                .foregroundColor(.white)
                                                                .multilineTextAlignment(.leading)
                                                                .padding(.bottom, 10)
                                                                .padding(.horizontal, 8)
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
                            }
                        }
                    }
                }
                .toolbarBackground(.hidden, for: .navigationBar)
            }
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

//struct VideoPalyer: UIViewControllerRepresentable {
//    @Binding var player: AVPlayer
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let controller = AVPlayerViewController()
//        controller.player = player
//        controller.showsPlaybackControls = false
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//
//    }
//}

struct FilmDetails_Previews: PreviewProvider {
    static var previews: some View {
        let film = Movie(movieTitle: "Zhau zhurek myn bala",
                         imageName: "Movie1",
                         genre: "Drama, Adventure, War, Historical",
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
                                   reviewAuthor: "Arailym Bakenova",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom."),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: "Arailym Bakenova",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom."),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: "Arailym Bakenova",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom."),
                            Review(reviewTitle: "The first Kazakh movie I have ever watched...",
                                   reviewAuthor: "Ivan Ivanov",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.")
                         ],
                         videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f")
        FilmDetails(film: film).preferredColorScheme(.dark)
    }
}
