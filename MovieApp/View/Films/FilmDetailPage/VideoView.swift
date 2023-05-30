//
//  VideoView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 03.05.2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    
    var videoUrl: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = AVPlayer(url: videoUrl)
        playerViewController.videoGravity = .resizeAspect
        playerViewController.allowsPictureInPicturePlayback = true
        playerViewController.view.transform = CGAffineTransform(rotationAngle: .pi/2)

        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update your view controller if needed
    }
}


struct VideoView: View {
    
    var video: Movie
    
    var body: some View {
        let videoUrl = URL(string: video.videoURL)!
        
        ZStack{
            VideoPlayerView(videoUrl: videoUrl)
            
            VStack{
                Text("Only for educational purpose")
                    .foregroundColor(.blue)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: Movie(movieTitle: "Zhau zhurek myn bala",
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
                                       reviewRate: "positive"),
                                Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                       reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                       reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                       reviewRate: "positive")
                               ],
                               videoURL: "https://www.dropbox.com/s/60ogynxyne5eyig/ZXhATkf7.mp4?raw=1")
        )
    }
}
