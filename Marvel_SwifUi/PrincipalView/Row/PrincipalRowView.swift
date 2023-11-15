//
//  PrincipalRowView.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 12/11/23.
//

import SwiftUI
import Kingfisher

struct PrincipalRowView: View {
    
    var character: Character
    
    var body: some View {
        ZStack {
#if os (watchOS)
            AsyncImage(url: character.thumbnail?.urlPhoto) { photo in
                photo
                    .resizable()
                    .frame(width: 172, height: 200, alignment: .center)
                    .cornerRadius(30)
                    .opacity(0.85)
                    .brightness(0.07)
                    .contrast(1.15)
                    .id(0)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                Text(character.name ?? "")
                    .frame(width: 172, height: 50, alignment: .center)
                    .font(.title3).background(.ultraThinMaterial)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                    .foregroundColor(.white)
                    .bold()
                    .padding([.top], 150)
                    .id(1)
#else
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
#endif
        }
        
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    PrincipalRowView(character: MockDataCharacter().characterOne)
}
