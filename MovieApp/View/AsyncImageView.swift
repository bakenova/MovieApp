//
//  AsyncImageView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct AsyncImageView: View {
    var imageName: String
    
    var body: some View {
        if let imageURL = URL(string: imageName) {
            WebImage(url: imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .frame(width: 100, height: 150)
                .onAppear {
                    SDWebImageManager.shared.loadImage(with: imageURL, options: [], progress: nil) { _, _, _, _, _, _ in
                        // Optional: Handle progress updates or completion
                    }
                }
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .frame(width: 100, height: 150)
        }
    }
}


//class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//
//    func loadImage(from imageName: String) {
//        DispatchQueue.global().async {
//            // Simulate image loading from a URL using URLSession
//            if let url = URL(string: imageName),
//               let data = try? Data(contentsOf: url),
//               let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = image
//                }
//            } else {
//                DispatchQueue.main.async {
//                    self.image = nil
//                }
//            }
//        }
//    }
//}
//
//struct AsyncImageView: View {
//    @ObservedObject var imageLoader: ImageLoader
//    let placeholder: Image
//
//    init(imageName: String, placeholder: Image = Image(systemName: "photo")) {
//        self.imageLoader = ImageLoader()
//        self.placeholder = placeholder
//        self.imageLoader.loadImage(from: imageName)
//    }
//
//    var body: some View {
//        if let image = imageLoader.image {
//            Image(uiImage: image)
//                .resizable()
//                .scaledToFit()
//        } else {
//            placeholder
//        }
//    }
//}

