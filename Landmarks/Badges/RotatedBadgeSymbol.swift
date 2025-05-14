import SwiftUI


struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60) // Bu yakınlaştırıp uzaklaştırıyor
            .rotationEffect(angle, anchor: .bottom)
    }
}


#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))/* Angle(degrees: 5) bu kısımda ne kadar döndürmek istediğimizi giriyoruz .*/
}
