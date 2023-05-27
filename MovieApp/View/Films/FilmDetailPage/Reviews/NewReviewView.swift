//
//  NewReviewView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 11.05.2023.
//

import SwiftUI

struct NewReviewView: View {
    
    @Environment(\.colorScheme) var scheme
    @ObservedObject private var vm = UserManager()
    @ObservedObject var viewModel: FilmDetailViewModel
    
    @State private var reviewTitle = ""
    @State private var reviewAuthorName = ""
    @State private var reviewDescription = ""
    @State private var reviewRate = "neutral"
    
    let reviewRates = ["positive", "negative", "neutral"]
    @State var film: Movie
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("Please share your opinion about the film")
                    .font(.largeTitle.bold())
                    .frame(height: 200)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Enter your review title")
                        .foregroundColor(Color.primary)
                    
                    TextField("Review Title", text: $reviewTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.gray, width: 1) // Add a border to the TextEditor
                        .cornerRadius(15)
                }
                .padding(.top, -10)
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Enter your review description")
                        .foregroundColor(Color.primary)
                    
                    TextEditor(text: $reviewDescription)
                        .frame(height: 200)
                        .border(Color.gray, width: 1) // Add a border to the TextEditor
                        .cornerRadius(15)
                }
                .padding()
                
                VStack(alignment: .center){
                    Picker("Review Rate", selection: $reviewRate) {
                        ForEach(reviewRates, id: \.self) { rate in
                            Text(rate)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Button(action: {
                        let user = vm.user
                        //var review = Review(reviewTitle: reviewTitle, reviewAuthor: user ?? User(uid: "", username: "unknown", email: "", firstName: "", lastName: "", phoneNumber: ""), reviewDescription: reviewDescription, reviewRate: reviewRate)
                        
                        // Actions with the newly created review, such as saving it to a list or database
                        let newReview = Review(
                            reviewTitle: reviewTitle,
                            reviewAuthor: user ?? User(uid: "", username: "unknown", email: "", firstName: "", lastName: "", phoneNumber: ""),
                            reviewDescription: reviewDescription,
                            reviewRate: reviewRate
                        )
                        
                        // Add the new review to the movie
                        viewModel.addReview(newReview, to: film)
                        
                        // Reset the input fields
                        reviewTitle = ""
                        reviewAuthorName = ""
                        reviewDescription = ""
                        reviewRate = ""
                    }, label: {
                        ButtonView(title: "Add Review", imageName: "square.and.pencil", color: .blue, cornerRadius: 15, width: proxy.size.width - 60, height: 50, fontSize: 16)
                            .tint(.white)
                    })
                    .padding(.top, 20)
                }
                Spacer()
            }
            .padding(.top, -60)
            .padding(.horizontal, 10)
        }
    }
}

struct NewReviewView_Previews: PreviewProvider {
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
        let collection = "Popular"
        return VStack {
            NewReviewView(viewModel: viewModel, film: film).preferredColorScheme(.dark)
        }
    }
}
