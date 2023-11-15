//
//  PrincipalView.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import SwiftUI

struct PrincipalView: View {
    @StateObject var viewModel: PrincipalViewModel
    
    var body: some View {
        if viewModel.isLoading{
            LaunchScreen()
        } else {
            NavigationStack{
                List{
                    ForEach(viewModel.characters){ character in
                        NavigationLink(destination: {
                            DetailView(viewModel: DetailViewModel(characterID: character.id!))
                        }, label: {
                            #if os(watchOS)
                            PrincipalRowView(character: character)
                            #else
                            PrincipalRowView(character: character)
                                .frame(minWidth: 400,minHeight: 280, alignment: .center)
                                .padding(.leading, 15)
                            #endif
                        })
                        .onAppear {
                            viewModel.loadMoreCharactersIfNeeded(character: character)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationBarTitle("Marvel Heroes")
            }
        }
    }
}


#Preview {
    PrincipalView(viewModel: PrincipalViewModel())
}
