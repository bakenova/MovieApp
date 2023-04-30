//
//  UI.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation
import SwiftUI
import ExpandableText

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
                    .frame(width: 24, height: 24)
                Text(title)
                    .bold()
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
                    //.foregroundColor(.white)
            }
        }
        
        
    }
}

struct ExpandableText_Test: View {
    
    var body: some View {
        ExpandableText(text: "Do you think you're living an ordinary life? You are so mistaken it's difficult to even explain. The mere fact that you exist makes you extraordinary. The odds of you existing are less than winning the lottery, but here you are. Are you going to let this extraordinary opportunity pass?")
            .font(.body)//optional
            .foregroundColor(.primary)//optional
            .lineLimit(3)//optional
            .animation(.easeIn)
            .padding(.horizontal, 24)//optional
    }
}

