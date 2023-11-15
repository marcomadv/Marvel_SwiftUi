//
//  PrincipalRowView.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 12/11/23.
//

import SwiftUI

struct PrincipalRowView: View {
    
    var character: Character
    
    var body: some View {
        ZStack {
            AsyncImage(url: character.thumbnail?.urlPhoto) { photo in
                photo
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                    .cornerRadius(30)
                    .opacity(0.85)
                    .brightness(0.07)
                    .contrast(1.15)
                    .shadow(color: .black, radius: 15, x: 5, y: 5)
                    .id(0)
                    .overlay(
                        Text(character.name ?? "")
                            .frame(width: 250, height: 50, alignment: .center)
                            .font(.title3).background(.ultraThinMaterial)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                            .foregroundColor(.white)
                            .bold()
                            .padding([.top], 200)
                            .id(1)
                    )} placeholder: {
                        ProgressView()
                            .frame(width: 200, height: 200, alignment: .center)
                    }
        }
        
        .padding([.top, .bottom], 5)
    }
}

#Preview {
    PrincipalRowView(character: MockDataCharacter().characterOne)
}
