import SwiftUI
import SDWebImageSwiftUI
import AVFoundation

struct SongDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme
    
    let song: Song
    @State private var progress: Float = 0.0
    @State private var player: AVAudioPlayer?
    @State private var isPlaying = false
    
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
                    
                    Slider(value: $progress, in: 0...Float(song.duration), step: 1.0, onEditingChanged: sliderEditingChanged)
                        .accentColor(.blue)
                    
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
            .onAppear(perform: prepareAudioPlayer)
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
        player?.currentTime = time
    }
    
    func startPlayback() {
        player?.play()
        isPlaying = true
    }
    
    func stopPlayback() {
        player?.stop()
        player = nil
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
        
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = documentsDirectoryURL.appendingPathComponent("audio.mp3")
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: audioURL)
        
        let task = session.downloadTask(with: request) { (tempLocalURL, response, error) in
            if let tempLocalURL = tempLocalURL, error == nil {
                do {
                    try FileManager.default.moveItem(at: tempLocalURL, to: destinationURL)
                    
                    DispatchQueue.main.async {
                        do {
                            self.player = try AVAudioPlayer(contentsOf: destinationURL)
                            self.player?.prepareToPlay()
                            self.player?.delegate = self.audioPlayerDelegate
                            self.audioPlayerDelegate.songDetailView = self
                        } catch let error {
                            print("Failed to create AVAudioPlayer: \(error)")
                        }
                    }
                } catch let error {
                    print("Failed to move downloaded file: \(error)")
                }
            } else {
                print("Failed to download audio file: \(error?.localizedDescription ?? "")")
            }
        }
        task.resume()
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
        SongDetailView(song: Song(name: "Следуй за мной", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 154, audioURL: "https://dl.dropboxusercontent.com/s/djx3f5nrkqis671/Shiza%20-%20Shym.mp3")
        ).preferredColorScheme(.dark)
    }
}
