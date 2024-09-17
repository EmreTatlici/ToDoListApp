//
//  HeaderView.swift
//  ToDo
//
//  Created by Mustafa Emre Tatlıcı on 15.09.2024.
//
import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String
    var angle: CGFloat
    var background: LinearGradient
    
    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(subtitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding()
            .background(background)  // Apply LinearGradient here
            .cornerRadius(15)
            .shadow(radius: 10)
            .rotationEffect(.degrees(Double(angle)))
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HeaderView(
        title: "Header Title",
        subtitle: "Subtitle Text",
        angle: 15,
        background: LinearGradient(
            gradient: Gradient(colors: [.purple.opacity(0.7), .blue.opacity(0.7)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    )
    .previewLayout(.sizeThatFits)
    .padding()
}
