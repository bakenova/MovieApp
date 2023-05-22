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
    
    @State private var reviewTitle = ""
    @State private var reviewAuthorName = ""
    @State private var reviewDescription = ""
    @State private var reviewRate = "neutral"
    
    let reviewRates = ["positive", "negative", "neutral"]
    
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
                        let review = Review(reviewTitle: reviewTitle, reviewAuthor: user ?? User(uid: "", username: "unknown", email: "", firstName: "", lastName: "", phoneNumber: ""), reviewDescription: reviewDescription, reviewRate: reviewRate)
                        
                        // Actions with the newly created review, such as saving it to a list or database
                        
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
        NewReviewView().preferredColorScheme(.dark)
    }
}
