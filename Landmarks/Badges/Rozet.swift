import SwiftUI


struct Badge: View {
    var badgeSymbols: some View {
        
        /*Rozet sembolünün kopyalarını döndürmek ve görüntülemek için bir görünüm ekleyin .ForEach*/
        ForEach(0..<8) { index in
                  RotatedBadgeSymbol(
                      angle: .degrees(Double(index) / Double(8)) * 360.0
                  )
              }
              .opacity(0.5)
    }
    var body: some View {
        /*Rozetin sembolünü rozetin arka planının üzerine yerleştirin
         ZStack görüntüleri üst üste bindirir.*/
           ZStack {
               BadgeBackground()
               
               /*Rozet sembolünün boyutunu, çevresindeki geometriyi okuyarak ve sembolü ölçeklendirerek düzelttik*/
               GeometryReader { geometry in
                             badgeSymbols
                                 .scaleEffect(1.0 / 4.0, anchor: .top)
                                 .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
                         }
              
           }
            /*.scaledToFit() SwiftUI'da, bir görüntü veya şeklin boyutlarını, mevcut alana sığacak şekilde ölçeklendirir ve orijinal en-boy oranını korur.*/
           .scaledToFit()
    }
}




#Preview {
    Badge()
}
