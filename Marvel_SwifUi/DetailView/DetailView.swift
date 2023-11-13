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
        VStack{
            ScrollView{
                ForEach(viewModel.series) { serie in
                    DetailRowView(serie: serie)
                        .frame(minWidth: 350, idealWidth: 350, maxWidth: 350, minHeight: 480, idealHeight: 480, maxHeight: 480, alignment: .center)
                }
            }
            .navigationBarTitle("Series", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.backward")
                        .padding(.leading, 10)
                }
            })
            
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(characterID: 1017109))
}
