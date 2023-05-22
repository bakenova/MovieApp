//
//  SongDetailView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import SwiftUI

struct SongDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme
    
    let song: Song
    @State private var progress: Float = 0.0
    
    var body: some View {
        GeometryReader{ proxy in
            VStack {
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.trailing, 25)
                    }
                }

                Image(song.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxy.size.width - 20, height: 400)
                    .cornerRadius(10)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                
                VStack(spacing: 5){
                    Text(song.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text(song.artist)
                        .font(.headline)
                        .foregroundColor(.gray)
                }.padding(.bottom, 10)
                
                HStack {
                    Text(timeString(time: Double(progress)))
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Slider(value: $progress, in: 0...Float(song.duration), step: 1.0)
                        .accentColor(.blue)
                    
                    Text(timeString(time: Double(song.duration)))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(width: proxy.size.width - 40)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                HStack {
                    Button(action: {}) {
                        Image(systemName: "text.justify")
                            .font(.title)
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    .padding(.trailing, 30)
                    
                    Button(action: {}) {
                        Image(systemName: "backward.end.fill")
                            .font(.title)
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    .padding(.trailing, 40)
                    
                    Button(action: {}) {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "forward.end.fill")
                            .font(.title)
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    .padding(.leading, 40)
                    
                    Button(action: {}) {
                        Image(systemName: "suit.heart.fill")
                            .font(.title)
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    .padding(.leading, 30)
                }
                .padding(.bottom, 50)
                
                //Lyrics
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
    }
    
    func timeString(time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185)
        ).preferredColorScheme(.dark)
    }
}
