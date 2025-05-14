//
//  HexagonParameters.swift..swift
//  Landmarks
//
//  Created by Owsito on 17.10.2024.
//

import CoreGraphics

struct HexagonParameters {
    /*SegmentAltıgenin bir kenarını temsil eden üç noktayı tutacak bir yapı tanımlayın ; kullanabilmeniz için içe aktarın .CoreGraphicsCGPoint
     
     Her taraf bir öncekinin bittiği yerden başlar, düz bir çizgide ilk noktaya doğru hareket eder ve sonra köşedeki Bézier eğrisi üzerinden ikinci noktaya doğru hareket eder. Üçüncü nokta eğrinin şeklini kontrol eder.*/
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
        
    }
    //Altıgenin şeklini ayarlamanıza olanak tanıyan bir ayar değeri ekleyin.
    static let adjustment: CGFloat = 0.085
        //Segmentleri tutacak bir dizi oluşturduk.
    static let segments = [
        /*Altıgenin her bir kenarı için bir tane olmak üzere altı segment için veri ekleyin.
         
         Değerler, kökeni sol üstte olan bir birim karenin kesri olarak saklanır, pozitif x sağda ve pozitif y aşağıdadır. Daha sonra, bu kesirleri belirli bir boyuttaki bir altıgenin gerçek noktalarını bulmak için kullanacaksınız.*/
        
        Segment(
            line:   CGPoint(x: 0.60, y: 0.05),
            curve:  CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20),
            curve:   CGPoint(x: 0.00, y: 0.30),
            control: CGPoint(x: 0.00, y: 0.25)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
                ),
                Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
                ),
                Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
                ),
                Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
                )
    ]
    
}

