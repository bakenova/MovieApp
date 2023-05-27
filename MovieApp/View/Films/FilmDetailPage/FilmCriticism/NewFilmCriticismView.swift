//
//  FilmCriticism.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 24.05.2023.
//

import SwiftUI

struct NewFilmCriticismView: View {
    @Environment(\.colorScheme) var scheme
    @ObservedObject private var vm = UserManager()
    
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
                    let review = FilmCriticism(criticismTitle: criticismTitle, criticismAuthor: user ?? User(uid: "", username: "unknown", email: "", firstName: "", lastName: "", phoneNumber: ""), criticismDescription: criticismDescription, actorRate: actorRate, directingRate: directingRate, soundRate: soundRate, scriptRate: scriptRate)
                    
                    // Actions with the newly created review, such as saving it to a list or database
                    submitCriticism()
                    
                }, label: {
                    ButtonView(title: "Add Criticism", imageName: "square.and.pencil", color: .blue, cornerRadius: 15, width: proxy.size.width - 60, height: 50, fontSize: 16)
                        .tint(.white)
                })
                .padding(.top, 20)
                
            }
            .padding()
            .navigationTitle("Film Criticism")
        }
    }
      
    private func submitCriticism() {
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
        NewFilmCriticismView()
    }
}
