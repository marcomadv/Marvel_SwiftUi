//
//  DetailRowViewWatch.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 15/11/23.
//

import SwiftUI

struct DetailRowViewWatch: View {
    
    var serie: Serie
    var body: some View {
        ZStack{
#if os (watchOS)
            AsyncImage(url: serie.thumbnail?.urlPhoto) { photo in
                photo
                    .resizable()
                    .frame(width: 200, height: 260, alignment: .center)
                    .cornerRadius(20)
                    .opacity(0.85)
                    .overlay(
                        Text(serie.title ?? "")
                            .frame(width: 180, height: 30, alignment: .center)
                            .font(.callout).background(.thinMaterial).cornerRadius(5)
                            .foregroundColor(.white)
                            .bold()
                    )
            } placeholder: {
                ProgressView()
            }
#endif
        }
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    DetailRowViewWatch(serie: MockDataSeries().serieTwo)
}
