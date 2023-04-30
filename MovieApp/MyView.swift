//
//  MyView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import SwiftUI

struct RoundedTextItem: Identifiable {
    let id = UUID()
    let text: String
}

struct CollectionView: View {
    
    let items = [
        RoundedTextItem(text: "Item 1"),
        RoundedTextItem(text: "Item 2"),
        RoundedTextItem(text: "Item 3"),
        RoundedTextItem(text: "Item 4"),
        RoundedTextItem(text: "Item 5"),
        RoundedTextItem(text: "Item 6"),
        RoundedTextItem(text: "Item 7"),
        RoundedTextItem(text: "Item 8"),
        RoundedTextItem(text: "Item 9"),
        RoundedTextItem(text: "Item 10"),
    ]
    
    let spacing: CGFloat = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            ForEach(items) { item in
                Text(item.text)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(20)
                    .padding(.trailing, spacing)
            }
        }
        .padding(.horizontal, spacing)
        .padding(.vertical, spacing / 2)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

