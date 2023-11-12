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
                    .cornerRadius(25)
                    .opacity(0.8)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    PrincipalRowView(character: MockDataCharacter().characterOne)
}
