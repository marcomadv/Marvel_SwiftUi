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
    private var totalItems: Int = 0
    private var suscriptor = Set<AnyCancellable>()
    @Published var isLoading: Bool = true

    
    init(apiCalls: ApiCalls = ApiCalls()) {
        self.apiCalls = apiCalls
        loadCharacters()
        
    }
    func loadCharacters() {
            do {
                try apiCalls.getCharacters(offset: self.characters.count)
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion {
                        case .finished:
                            print("Finalizada carga")
                            self.isLoading = false
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    } receiveValue: { [weak self] response in
                        self?.characters .append(contentsOf: response.data?.results ?? [] )
                        self?.totalItems = response.data?.total ?? 0
                    }
                    .store(in: &suscriptor)
                
            } catch {
                debugPrint(error.localizedDescription)
            }
    }
    
    func loadMoreCharactersIfNeeded(character: Character) {
        guard character.id == self.characters.last?.id,
              self.characters.count < self.totalItems else {
            return
        }
        loadCharacters()
    }
}
