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
                    .frame(width: 300, height: 300, alignment: .center)
                    .cornerRadius(30)
                    .opacity(0.7)
                    .shadow(color: .gray, radius: 10, x: 10, y:5)
                    .overlay(
                        Text(character.name ?? "")
                            .font(.title3).background(.gray).cornerRadius(5)
                            .foregroundColor(.black)
                            .bold()
                            .padding([.top], 180)
            )} placeholder: {
                ProgressView()
            }
        }
        .padding([.top, .bottom], 5)
    }
}

#Preview {
    PrincipalRowView(character: MockDataCharacter().characterOne)
}
