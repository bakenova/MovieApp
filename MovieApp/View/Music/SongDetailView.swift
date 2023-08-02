//
//  SongDetailView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI
import AVFoundation

struct SongDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme
    
    let song: Song
    @State private var progress: Float = 0.0
    @State private var player: AVAudioPlayer? = nil
    @State private var isPlaying = false
    @State private var currentTime: TimeInterval = 0.0
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    private let audioPlayerDelegate = AudioPlayerDelegate()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    Button {
                        stopPlayback()
                        dismiss()
                    } label: {
                        Text("Close")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.trailing, 25)
                    }
                }
                
                WebImage(url: URL(string: song.imageName))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxy.size.width - 20, height: 400)
                    .cornerRadius(10)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                
                VStack(spacing: 5) {
                    Text(song.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text(song.artist)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text(timeString(time: Double(progress)))
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Slider(value: Binding(get: {
                                Float(currentTime)
                            }, set: { newValue in
                                let time = Double(newValue)
                                seekToTime(time)
                            }), in: 0...Float(song.duration), step: 1.0)
                            .accentColor(.blue)
                            .onReceive(timer) { _ in
                                currentTime = player?.currentTime ?? 0.0
                                progress = Float(currentTime)
                            }
                    
                    Text(timeString(time: Double(song.duration)))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(width: proxy.size.width - 40)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                HStack {
                    Button(action: previousSong) {
                        Image(systemName: "backward.end.fill")
                            .font(.title)
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    .padding(.trailing, 40)
                    
                    Button(action: togglePlayback) {
                        Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    
                    Button(action: nextSong) {
                        Image(systemName: "forward.end.fill")
                            .font(.title)
                            .foregroundColor(self.scheme == .dark ? .white : .black)
                    }
                    .padding(.leading, 40)
                }
                .padding(.bottom, 50)
                
                // Lyrics
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
            .onAppear {
                prepareAudioPlayer()
            }

        }
    }
    
    func timeString(time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func sliderEditingChanged(editingStarted: Bool) {
        if editingStarted {
            stopPlayback()
        } else {
            let time = Double(progress)
            seekToTime(time)
            startPlayback()
        }
    }
    
    func seekToTime(_ time: Double) {
        self.player?.currentTime = time
    }

    func startPlayback() {
        player?.currentTime = TimeInterval(progress)
        player?.play()
        isPlaying = true
    }


    func stopPlayback() {
        self.player?.stop()
        isPlaying = false
    }

    func togglePlayback() {
        if isPlaying {
            stopPlayback()
        } else {
            startPlayback()
        }
    }
    
    func previousSong() {
        // Implement logic for playing the previous song
    }
    
    func nextSong() {
        // Implement logic for playing the next song
    }

    func prepareAudioPlayer() {
        guard let audioURL = URL(string: song.audioURL) else {
            print("Invalid audio URL")
            return
        }

        URLSession.shared.dataTask(with: audioURL) { [self] data, _, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.player = try AVAudioPlayer(data: data)
                        self.player?.prepareToPlay()
                        self.player?.delegate = audioPlayerDelegate
                        audioPlayerDelegate.songDetailView = self
                        startPlayback() // Start the playback here
                    } catch let error {
                        print("Failed to create AVAudioPlayer: \(error)")
                    }
                }
            } else if let error = error {
                print("Failed to load audio data: \(error)")
            }
        }.resume()
    }

    func prepareAudioPlayer1() {
        guard let audioURL = URL(string: song.audioURL) else {
            print("Invalid audio URL")
            return
        }
        
        do {
            let audioData = try Data(contentsOf: audioURL)
            self.player = try AVAudioPlayer(data: audioData)
            self.player?.prepareToPlay()
            self.player?.delegate = audioPlayerDelegate
            audioPlayerDelegate.songDetailView = self
        } catch let error {
            print("Failed to create AVAudioPlayer: \(error)")
        }
    }
}

class AudioPlayerDelegate: NSObject, AVAudioPlayerDelegate {
    var songDetailView: SongDetailView?
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        songDetailView?.stopPlayback()
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song:
                        Song(name: "Моя любов", artist: "Akha", imageName: "https://dl.dropboxusercontent.com/s/81a8oehq1xqkase/ab67616d00001e024742e348aa66a4c0b4aa31ff.jpg", releaseDate: "2022", album: "Моя любовь", duration: 151, audioURL: "https://dl.dropboxusercontent.com/s/e3pmlzxmqk0wvs0/Akha%20-%20%D0%9C%D0%BE%D1%8F%20%D0%9B%D1%8E%D0%B1%D0%BE%D0%B2%D1%8C.mp3")
        ).preferredColorScheme(.dark)
    }
}
