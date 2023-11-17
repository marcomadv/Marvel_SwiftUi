//
//  LaunchScreenWatch.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 15/11/23.
//

import UIKit
import SwiftUI

struct LaunchScreenWatch: View {
    
    var body: some View {
        VStack{
            ZStack{
#if os(watchOS)
                Image("Wallpaper", bundle: nil)
                                  .resizable()
                                  .frame(width: 200, height: 280, alignment: .center)
                Image("MarvelLogo", bundle: nil)
                    .resizable()
                    .frame(width: 180, height: 100, alignment: .center)
                    .opacity(0.65)
                ProgressView()
#endif
            }
        }
    }
}
                
#Preview {
    LaunchScreenWatch()
}
