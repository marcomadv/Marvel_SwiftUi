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
        NavigationStack{
            VStack{
                List{
                    ForEach(viewModel.characters){ character in
                        NavigationLink(destination: {
                            DetailView(viewModel: DetailViewModel(characterID: character.id!))
                        }, label: {
                                PrincipalRowView(character: character)
                                .frame(minWidth: 400,minHeight: 250, alignment: .center)
                        })
                        .onAppear {
                            viewModel.loadMoreCharactersIfNeeded(character: character)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarTitle("Marvel Heroes")
        }
    }
}
    
    #Preview {
        PrincipalView(viewModel: PrincipalViewModel())
    }
