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
                    .frame(width: 350, height: 450, alignment: .center)
                    .cornerRadius(20)
                    .opacity(0.85)
                    .overlay(
                        Text(serie.title ?? "")
                            .font(.title2).background(.thinMaterial).cornerRadius(5)
                            .foregroundColor(.black)
                            .bold()
                    )
                } placeholder: {
                    ProgressView()
                }
            HStack{
                if serie.description != nil{
                    Text(serie.description!)
                        .font(.callout)
                        .padding([.leading, .trailing], 5)
                        .frame(width: 350, height: 150, alignment: .center)
                        .background(.ultraThinMaterial).opacity(0.9)
                        .cornerRadius(20)
                        .foregroundStyle(.black)
                        .padding(.top, 300)
                }
            }
        }
        .shadow(radius: 10, y: 10)
        .padding([.top, .bottom], 15)
    }
}

#Preview {
    DetailRowView(serie: MockDataSeries().serieTwo)
}
