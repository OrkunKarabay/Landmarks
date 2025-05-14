//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Owsito on 17.10.2024.
//

import SwiftUI

struct BadgeSymbol: View {
    
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

    var body: some View {
        
        /*Sembolün üst kısmını yol API'lerini kullanarak çizin.Ortası boş bir üçgen çizdirdik
         
         Deney

         Aralık , ve sabitlerle ilişkili sayısal çarpanları ayarlayarak bunların genel şekli nasıl etkilediğini görün.topWidthtopHeight*/
        GeometryReader { geometry in
            /*GeometryReader, ekranın veya kapsayıcı alanın boyutlarını öğrenmemizi sağlayan bir yapı.
             Bu, ekranın boyutlarına duyarlı bir tasarım yapmayı sağlar.
             Böylece şekiller, cihaz ekranına göre boyutlandırılabilir.*/
            Path { path in
                /*Path, 2D şekilleri çizmek için kullanılan bir yapı. Path içerisine noktalar ve çizgiler eklenerek bir şekil oluşturulabilir.*/
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                /*width: Ekranın genişliği ve yüksekliği arasındaki minimum değer alınıyor, bu sayede şekil karesi bir alan içerisine sığacak şekilde boyutlandırılıyor.
                 height: Genişliğin %75’i kadar bir yükseklik hesaplanıyor.
                 spacing: Genişliğin %3’ü kadar bir boşluk veya aralık ayarlanıyor.
                 middle: Şeklin tam ortası, genişliğin yarısı olarak belirleniyor.
                 topWidth ve topHeight: Şeklin tepe noktasının genişliği ve yüksekliği hesaplanıyor, bu oranlar çizimin karakteristik özelliklerini ayarlamak için kullanılıyor.
                 */
                
                
                path.addLines([
                    /*CGPoint(x: y:): 2D koordinat sistemi üzerinde bir nokta oluşturur. x yatay, y ise dikey eksendeki konumu ifade eder.
                     İlk nokta, ortada yukarıda bir noktada başlar: CGPoint(x: middle, y: spacing)
                     İkinci nokta, şeklin sol üst köşesine gider: CGPoint(x: middle - topWidth, y: topHeight - spacing)
                     Üçüncü nokta, yukarıda bir iç kısım noktasına gider: CGPoint(x: middle, y: topHeight / 2 + spacing)
                     Dördüncü nokta, şeklin sağ üst köşesine gider: CGPoint(x: middle + topWidth, y: topHeight - spacing)
                     Son nokta, şeklin başladığı yere döner: CGPoint(x: middle, y: spacing)*/
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                    /*Özet:
                     Bu kod, dinamik olarak bir şekil çizen bir Path oluşturuyor. GeometryReader ile ekran boyutlarına duyarlı hale getirilen bu şekil, belirli oranlara ve noktalar arasındaki çizgilere dayalı olarak hesaplanıyor. Kodun amacı, belirli bir düzenle şekil çizmek ve bu şeklin ekran boyutlarına uyumlu olmasını sağlamak.*/
                ])
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                /*move(to:), çizimi başlatacağınız noktayı belirler ancak henüz bir çizgi çizmez. Bu noktadan başlayarak daha sonra çizgiler çizeceğiz.
                 CGPoint(x: y:), iki boyutlu bir noktayı tanımlar. Burada:
                 x: middle: Yatay eksende, şeklin tam ortası.
                 y: topHeight / 2 + spacing * 3: Dikey eksende, şeklin üst yarısının yarısı kadar bir mesafeye, biraz boşluk eklenmiş bir noktaya gidilir. Bu, şeklin başladığı nokta olarak tanımlanıyor.*/
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                    /*Birinci Nokta: CGPoint(x: middle - topWidth, y: topHeight + spacing)
                     
                     Bu, şeklin ortasından biraz sola kayarak bir nokta oluşturur. middle - topWidth, ortanın soluna doğru bir mesafeyi, topHeight + spacing ise şeklin üst yüksekliğinin biraz altına (spacing ile) inen bir noktayı tanımlar.
                     İkinci Nokta: CGPoint(x: spacing, y: height - spacing)
                     
                     Bu nokta, şeklin sol alt köşesine yakın bir noktadır. spacing ile şeklin sol kenarından küçük bir boşluk bırakılır. height - spacing ile alt sınırdan biraz yukarıya yerleştirilir.
                     Üçüncü Nokta: CGPoint(x: width - spacing, y: height - spacing)
                     
                     Bu, şeklin sağ alt köşesine yakın bir noktadır. width - spacing sağ kenardan biraz içeride, height - spacing ise alt kenardan yukarıda bir noktayı ifade eder. Bu şekilde, şeklin alt kısmında yatay bir çizgi çekilecek.
                     Dördüncü Nokta: CGPoint(x: middle + topWidth, y: topHeight + spacing)
                     
                     Bu nokta, ortanın sağ tarafına doğru bir noktadır. middle + topWidth, ortanın sağına doğru bir mesafe kaydırır, topHeight + spacing ise şeklin üst yüksekliği yakınlarında bir noktayı ifade eder.
                     Beşinci Nokta: CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                     
                     Son olarak, şekil başladığı yere geri döner. Bu nokta ilk move(to:) ile belirlenen noktadır. Böylece şekil tamamlanmış olur.*/
                ])
            }
            .fill(Self.symbolColor)
                }
    }
}

#Preview {
    BadgeSymbol()
}
