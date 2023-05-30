//
//  MusicViewModel.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.05.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MusicViewModel: ObservableObject {
    @Published var musicSelections: [MusicSelection] = []
    @Published var artistPlaylists: [ArtistPlaylist] = []
        
    private var listener: ListenerRegistration?
    let db = Firestore.firestore()
    
    //MARK: - Music Selection Playlist
    func fetchData() {
        db.collection("musicSelections").getDocuments { snapshot, error in
            if let error = error {
                // Handle error
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                // Handle empty snapshot
                print("No documents found.")
                return
            }
            
            // Clear existing data
            self.musicSelections = []
            
            // Iterate through documents and create MusicSelection instances
            for document in documents {
                if let musicSelection = self.parseMusicSelection(from: document) {
                    self.musicSelections.append(musicSelection)
                }
            }
        }
    }
    
    private func parseMusicSelection(from document: DocumentSnapshot) -> MusicSelection? {
        do {
            // Use the document data to create a MusicSelection instance
            let data = try document.data(as: MusicSelection.self)
            print(data)
            return data
        } catch {
            // Handle parsing error
            print("Error parsing document: \(error.localizedDescription)")
            return nil
        }
    }
    
    func addMusicSelection(_ musicSelection: MusicSelection) {
        musicSelections.append(musicSelection)
        // You can also save the added music selection to Firestore if needed
        saveMusicSelection(musicSelection)
    }
    
    private func saveMusicSelection(_ musicSelection: MusicSelection) {
        do {
            // Convert the musicSelection to a dictionary
            let data = try Firestore.Encoder().encode(musicSelection)
            
            // Save the data to Firestore
            db.collection("musicSelections").document(musicSelection.id).setData(data)
        } catch {
            // Handle encoding or saving error
            print("Error saving music selection: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Artist Playlist
    func fetchArtistPlaylists() {
        let artistPlaylistsRef = db.collection("artistPlaylists")
        
        listener = artistPlaylistsRef.addSnapshotListener { [weak self] snapshot, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching artist playlists: \(error.localizedDescription)")
                return
            }
            
            if let documents = snapshot?.documents {
                self.artistPlaylists = documents.compactMap { document in
                    try? document.data(as: ArtistPlaylist.self)
                }
            }
        }
    }
    
    func stopListening() {
        listener?.remove()
    }
    
    func addArtistPlaylist(_ artistPlaylist: ArtistPlaylist) {
        let artistPlaylistsRef = db.collection("artistPlaylists")
        
        do {
            _ = try artistPlaylistsRef.addDocument(from: artistPlaylist) { error in
                if let error = error {
                    print("Error adding artist playlist: \(error.localizedDescription)")
                } else {
                    print("Artist playlist added successfully")
                }
            }
        } catch {
            print("Error encoding artist playlist: \(error.localizedDescription)")
        }
    }
}
