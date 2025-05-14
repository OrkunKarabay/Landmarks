import SwiftUI


struct BadgeBackground: View {
    var body: some View {
        GeometryReader{ geometry in
            Path { path in
                
                
                /*100 x 100 piksel boyutunda bir kap olduğunu varsayarak yola bir başlangıç ​​noktası ekleyin.
                 
                 */
                
                /*Yolu, rozetin boyutunu tanımlayan ve değeri sabit kodlamak yerine boyutu tanımlayan bir görünüme sararak kullanın ( ).GeometryReader100
                 
                 Geometrinin iki boyutundan en küçüğünü kullanmak, rozetin bulunduğu görünüm kare olmadığında rozetin en boy oranını korur.*/
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
               
                //Şekli x ekseninde ölçeklendirin ve ardından şekli kendi geometrisi içinde yeniden merkezlemek için ekleyin.xScalexOffset
                
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                /*Yöntem move(to:), çizim imlecini şeklin sınırları içerisinde sanki hayali bir kalem veya kurşun kalem çizime başlamak için alanın üzerinde bekliyormuş gibi hareket ettirir.*/
                path.move(
                    
                    to: CGPoint(
                        
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                /*Şekil verilerinin her noktası için çizgileri çizerek kabaca altıgen bir şekil oluşturun.
                 
                 Yöntem tek bir nokta alır ve onu çizer. Bir çizgiyi önceki noktadan başlatıp yeni noktaya devam etmek için ardışık çağrılar.addLine(to:)addLine(to:)*/
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve (
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                            
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                            
                        )
                    )
                }
                
            }
            
            /*Bu kod Self.gradientStart ve Self.gradientEnd iki farklı renk olarak belirtilmiş. Bu renkler arasında geçiş sağlanacak.
             startPoint: Gradyanın başlangıç noktası. Bu, gradyanın nereden başlayacağını belirtir. UnitPoint(x: 0.5, y: 0) ifadesi, gradyanın x ekseninde %50 (ortadan) ve y ekseninde 0 (yukarıdan) başlamasını sağlar. Yani, bu durumda gradyan şeklin tam ortasının üstünden başlıyor.
             endPoint: Gradyanın bitiş noktası. Bu, gradyanın nerede sona ereceğini belirtir. UnitPoint(x: 0.5, y: 0.6) ifadesi, gradyanın x ekseninde yine ortada (0.5), ancak y ekseninde 0.6 (şeklin %60’ı kadar aşağı) bitmesini sağlar. Bu, gradyanın aşağı doğru akışını belirler.
             */
            .fill(.linearGradient(
                            Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 0.6)
                        ))
     
        }
        /*Bu kod, görünümü kare yapar (en-boy oranı 1:1) ve alanın tamamına orantılı bir şekilde sığacak şekilde yerleştirir. Eğer görünüm mevcut alanın boyutlarına tam olarak uymuyorsa, oranı koruyarak en fazla alana sığacak şekilde küçültülür veya büyütülür. Boş alanlar kalabilir, ancak görüntü kesilmez.
         aspectRatio(1) → Kare (genişlik = yükseklik)
         aspectRatio(2) → Dikdörtgen (genişlik = 2 × yükseklik)
         .fit (Contain Mode): Görünümü mevcut alana sığdırır, ancak görünümün oranını bozmadan.
         .fill (Cover Mode): Görünüm mevcut alanı doldurur, fakat bu sırada en-boy oranı bozulabilir. */
        .aspectRatio(1, contentMode: .fit)
    }
    
    /*Gradient renginini renk kodunu girdik.*/
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
        static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
