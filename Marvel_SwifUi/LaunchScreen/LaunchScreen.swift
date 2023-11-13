//
//  LaunchScreen.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 13/11/23.
//
import UIKit
import SwiftUI

struct LaunchScreen: View {
    
    var body: some View {
        VStack{
            ZStack{
                Image("Wallpaper", bundle: nil)
                    .resizable()
                    .frame(minWidth: 420, idealWidth: 420, maxWidth: .infinity, minHeight: 880, idealHeight: 880, maxHeight: .infinity, alignment: .center)
                    .id(0)
                Image("MarvelLogo", bundle: nil)
                    .resizable()
                    .frame(width: 250, height: 100, alignment: .center)
                    .opacity(0.65)
                    .id(1)
                ProgressView()
            }
        }
    }
}


#Preview {
    LaunchScreen()
}
