//
//  DetailView.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var viewModel : DetailViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.series) { serie in
                    DetailRowView(serie: serie)
                        .frame(minWidth: 350, idealWidth: 350, maxWidth: 350, minHeight: 480, idealHeight: 480, maxHeight: 480, alignment: .center)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(characterID: 1017109))
}
