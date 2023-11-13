//
//  LaunchScreen.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 13/11/23.
//
import UIKit
import SwiftUI

struct LaunchScreen: View {
    
    @State var isLoading = true
    var body: some View {
        VStack{
            ZStack{
                if isLoading{
                    Image("Wallpaper", bundle: nil)
                        .resizable()
                        .frame(minWidth: 420, idealWidth: 420, maxWidth: .infinity, minHeight: 880, idealHeight: 880, maxHeight: .infinity, alignment: .center)
                    Image("MarvelLogo", bundle: nil)
                        .resizable()
                        .frame(width: 250, height: 100, alignment: .center)
                        .opacity(0.65)
                    ProgressView()
                    
                } else {
                    PrincipalView(viewModel: PrincipalViewModel())
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.6)){
                    self.isLoading = true
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
