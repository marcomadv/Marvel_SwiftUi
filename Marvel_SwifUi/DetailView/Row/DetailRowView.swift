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
                    .cornerRadius(20)
                    .opacity(0.7)
                    .overlay(
                        Text(serie.title ?? "")
                            .font(.title).background(.gray).cornerRadius(5)
                            .foregroundColor(.black)
                            .bold()
                    )
                } placeholder: {
                    ProgressView()
                }
            HStack{
                Text(serie.description ?? "")
                    .background().opacity(0.8)
                    .cornerRadius(5)
                    .foregroundStyle(.black)
                    .bold()
                    .padding([.trailing, .leading], 15)
                    .padding(.top, 600)
            }
        }
    }
}

#Preview {
    DetailRowView(serie: MockDataSeries().serieTwo)
}
