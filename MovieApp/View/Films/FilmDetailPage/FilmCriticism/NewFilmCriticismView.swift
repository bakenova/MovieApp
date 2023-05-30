//
//  FilmCriticism.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 24.05.2023.
//

import SwiftUI

struct NewFilmCriticismView: View {
    @Environment(\.colorScheme) var scheme
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var vm = UserManager()
    @ObservedObject var viewModel: FilmDetailViewModel
    var film: Movie
    
    @State private var criticismTitle: String = ""
    @State private var criticismAuthor: String = ""
    @State private var criticismDescription: String = ""
    @State private var actorRate: Int = 0
    @State private var directingRate: Int = 0
    @State private var soundRate: Int = 0
    @State private var scriptRate: Int = 0
    
    let ratingOptions = Array(0...10)
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView{
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Actor Performance")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        Picker("Actor Performance", selection: $actorRate) {
                            ForEach(ratingOptions, id: \.self) { rating in
                                Text("\(rating)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        
                        Text("Directing")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        Picker("Directing", selection: $directingRate) {
                            ForEach(ratingOptions, id: \.self) { rating in
                                Text("\(rating)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        
                        Text("Sound Engineering")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        Picker("Sound Engineering", selection: $soundRate) {
                            ForEach(ratingOptions, id: \.self) { rating in
                                Text("\(rating)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        
                        Text("Literacy of the Script")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        Picker("Literacy of the Script", selection: $scriptRate) {
                            ForEach(ratingOptions, id: \.self) { rating in
                                Text("\(rating)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Enter your review title")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        
                        TextField("Review Title", text: $criticismTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.gray, width: 1) // Add a border to the TextEditor
                            .cornerRadius(15)
                    }
                    .padding(.top, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Enter your review description")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        
                        TextEditor(text: $criticismDescription)
                            .frame(height: 200)
                            .border(Color.gray, width: 1) // Add a border to the TextEditor
                            .cornerRadius(15)
                    }
                    
                    Button(action: {
                        let user = vm.user
                        let review = FilmCriticism(criticismTitle: criticismTitle, criticismAuthor: user ?? User(uid: "", username: "unknown", email: "", firstName: "", lastName: "", phoneNumber: ""), criticismDescription: criticismDescription, actorRate: actorRate, directingRate: directingRate, soundRate: soundRate, scriptRate: scriptRate, approved: false)
                        
                        // Actions with the newly created review, such as saving it to a list or database
                        submitCriticism(criticism: review)
                        
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ButtonView(title: "Add Criticism", imageName: "square.and.pencil", color: .blue, cornerRadius: 15, width: proxy.size.width - 60, height: 50, fontSize: 16)
                            .tint(.white)
                    })
                    .padding(.top, 20)
                    
                }
            }
            .padding()
            .navigationTitle("Film Criticism")
        }
    }
      
    private func submitCriticism(criticism: FilmCriticism) {
        viewModel.addCriticism(criticism, to: film)
        
        // Reset the input fields
        criticismTitle = ""
        criticismAuthor = ""
        criticismDescription = ""
        actorRate = 0
        directingRate = 0
        soundRate = 0
        scriptRate = 0
    }
}

struct NewFilmCriticismView_Previews: PreviewProvider {
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
                FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7, approved: true),
                FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7, approved: true)
              ],
              videoURL: "https://www.dropbox.com/s/60ogynxyne5eyig/ZXhATkf7.mp4?raw=1")
        
        let viewModel = FilmDetailViewModel()
        viewModel.reviews = film.reviews!
        return VStack {
            NewFilmCriticismView(viewModel: viewModel, film: film).preferredColorScheme(.dark)
        }
    }
}
