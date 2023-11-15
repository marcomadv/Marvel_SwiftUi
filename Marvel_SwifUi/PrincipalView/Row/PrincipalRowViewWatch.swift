import SwiftUI

struct PrincipalRowViewWatch: View {
    
    var character: Character
    
    var body: some View {
        ZStack {
#if os (watchOS)
            AsyncImage(url: character.thumbnail?.urlPhoto) { photo in
                photo
                    .resizable()
                    .frame(width: 200, height: 280, alignment: .center)
                    .cornerRadius(30)
                    .opacity(0.85)
                    .brightness(0.07)
                    .contrast(1.15)
                    .id(0)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Text(character.name ?? "")
                .frame(width: 200, height: 50, alignment: .center)
                .font(.title3).background(.ultraThinMaterial)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                .foregroundColor(.white)
                .bold()
                .padding([.top], 170)
                .id(1)
#endif
        }
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    PrincipalRowViewWatch(character: MockDataCharacter().characterOne)
}
