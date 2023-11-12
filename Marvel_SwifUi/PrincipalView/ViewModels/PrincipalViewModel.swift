//
//  PrincipalViewModel.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import Foundation
import Combine

class PrincipalViewModel: ObservableObject {
    private var apiCalls: ApiCalls
    
    @Published var characters: [Character] = []
    @Published var totalItems: Int?
    
    private var suscriptor = Set<AnyCancellable>()

    
    init(apiCalls: ApiCalls = ApiCalls()) {
        self.apiCalls = apiCalls
        loadCharacters()
        
    }
    func loadCharacters() {
        if self.characters.count < self.totalItems ?? 0{
            do {
                try apiCalls.getCharacters(offset: self.characters.count)
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion {
                        case .finished:
                            print("Finalizada carga")
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    } receiveValue: { [weak self] response in
                        self?.characters .append(contentsOf: response.data?.results ?? [] )
                        self?.totalItems = response.data?.total
                    }
                    .store(in: &suscriptor)
                
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func loadMoreCharactersIfNeeded(character: Character) {
        guard character.id == self.characters.last?.id else {
            return
        }
        loadCharacters()
    }
}
