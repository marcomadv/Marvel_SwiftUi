//
//  DetailViewModel.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private var apiCalls: ApiCalls
    
    @Published var series: [Serie] = []
    private var suscriptor = Set<AnyCancellable>()
    private var characterID: Int
    @Published var isLoading: Bool = true
    
    init(apiCalls: ApiCalls = ApiCalls(), characterID: Int) {
        self.apiCalls = apiCalls
        self.characterID = characterID
        loadSeries()
    }
    
    func loadSeries() {
        do{
           try apiCalls.getSeries(characterID: characterID)
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("Carga de datos finalizada")
                        self.isLoading = false
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] response in
                    self?.series = response.data?.results ?? []
                }
                .store(in: &suscriptor)
            
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
