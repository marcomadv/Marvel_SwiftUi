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
        List{
            ForEach(viewModel.series){ serie in
                Text(serie.title ?? "noname")
            }
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(characterID: 1017100))
}
