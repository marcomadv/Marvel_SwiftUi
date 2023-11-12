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
                    .frame(width: 200, height: 200, alignment: .center)
                    .cornerRadius(30)
                    .opacity(0.85)
                    .brightness(0.07)
                    .contrast(1.15)
                    .shadow(color: .black, radius: 15, x: 5, y: 5)
                    .overlay(
                Text(character.name ?? "")
                    .font(.title3).background(.ultraThinMaterial)
                    .fontWeight(.bold)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .bold()
                    .padding([.top], 120)
           )} placeholder: {
                ProgressView()
                   .frame(width: 200, height: 200, alignment: .center)
            }
        }
        .padding([.top, .bottom], 10)
        
    }
}

#Preview {
    PrincipalRowView(character: MockDataCharacter().characterOne)
}
