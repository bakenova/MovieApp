//
//  UI.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation
import SwiftUI
import ExpandableText
import SDWebImageSwiftUI

struct ButtonView: View {
    
    var title: String
    var imageName: String
    var color: Color
    var cornerRadius: CGFloat
    var width: CGFloat
    var height: CGFloat
    var fontSize: CGFloat
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: width, height: height, alignment: .center)
                .foregroundColor(color)
            
            HStack(spacing: 8){
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                Text(title)
                    .bold()
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        
        
    }
}

struct MovieListView: View {
    var item: Movie
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: item.imageName))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 80)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 5){
                Text(item.movieTitle)
                    .frame(alignment: .leading)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding(.trailing, 24)
                Text(item.releaseDate)
                    .frame(alignment: .leading)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.trailing, 24)
                Text("Watch now")
                    .frame(alignment: .leading)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.trailing, 24)
            }
        }
    }
}

struct MusicHListView: View {
    var item: Song
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: item.imageName))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 80)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 5){
                Text(item.name)
                    .frame(alignment: .leading)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding(.trailing, 24)
                Text(item.releaseDate)
                    .frame(alignment: .leading)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.trailing, 24)
                Text("Listen now")
                    .frame(alignment: .leading)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.trailing, 24)
            }
        }
    }
}


struct CustomTextField: View {
    
    public struct CustomTextFieldStyle : TextFieldStyle {
        public func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .font(.title3) // set the inner Text Field Font
                .padding(10) // Set the inner Text Field Padding
                //Give it some style
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color.primary.opacity(0.5), lineWidth: 3))
        }
    }
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            TextField("Test", text: $username)
                .textFieldStyle(CustomTextFieldStyle()) // call the CustomTextField
            SecureField("Password", text: $password)
                .textFieldStyle(CustomTextFieldStyle())
        }.padding()
    }
}
