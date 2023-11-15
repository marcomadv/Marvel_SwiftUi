//
//  DetailView.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var viewModel : DetailViewModel
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        if viewModel.isLoading {
            ProgressViewPersonalized()
                .id(0)
        } else {
            VStack{
                ScrollView{
                    ForEach(viewModel.series) { serie in
#if os (watchOS)
                        DetailRowViewWatch(serie: serie)
#else
                        DetailRowView(serie: serie)
                            .frame(minWidth: 350, idealWidth: 350, maxWidth: 350, minHeight: 480, idealHeight: 480, maxHeight: 480, alignment: .center)
#endif
                    }
                }
            }
            .navigationTitle("Series").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(characterID: 1017109))
}
