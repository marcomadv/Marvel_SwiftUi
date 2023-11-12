//
//  DetailRowView.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 12/11/23.
//

import SwiftUI

struct DetailRowView: View {
    
    var serie: Serie
    var body: some View {
        ZStack{
            AsyncImage(url: serie.thumbnail?.urlPhoto) { photo in
                photo
                    .resizable()
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .opacity(0.5)
                    .overlay(
                        Text(serie.title ?? "")
                            .font(.title).background(.gray).cornerRadius(5)
                            .foregroundColor(.black)
                            .bold()
                    )
                } placeholder: {
                    ProgressView()
                }
        }
        HStack{
            Text(serie.description ?? "")
                .padding([.trailing, .leading], 15)
        }
    }
}

#Preview {
    DetailRowView(serie: MockDataSeries().serieTwo)
}
