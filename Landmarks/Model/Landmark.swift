//
//  Landmark.swift
//  Landmarks
//
//  Created by Owsito on 15.10.2024.
//

import Foundation
import SwiftUI
import CoreLocation

// LandmarkVeri dosyasındaki bazı anahtarların adlarıyla eşleşen birkaç özellik içeren bir yapı tanımladım.

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    /*Verilerden görüntünün adını okumak için bir özellik ve varlık kataloğundan bir görüntü yükleyen hesaplanmış bir özellik ekleyin .imageNameimage
     
     Mülkü özel kılıyorsunuz çünkü yapının kullanıcıları Landmarks sadece görüntünün kendisiyle ilgileniyorlar.*/
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
        /*Daha sonra, simge yapının konumuyla ilgili bilgileri yöneteceksiniz.
        Bu ifade, coordinates adında bir özel (private) değişken tanımlar. Bu değişken, Coordinates türünde bir veri tipidir. Bu tür, coğrafi koordinatları (enlem ve boylam) saklamak için kullanılır.
        Coordinates: coordinates değişkeni, az sonra tanımlanan Coordinates yapısını kullanır. */
        
    private var coordinates: Coordinates
    
    
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
    /*  struct: Swift'te yapılar veri tutmanın hafif bir yoludur. Coordinates yapısı, iki adet Double türünde değişkeni (latitude ve longitude) içerir.
        Hashable: Bu protokol, Coordinates yapısının hash tabanlı veri yapılarına (örneğin, set ve dictionary) eklenebilmesini sağlar. Aynı zamanda karşılaştırma işlemleri için kullanılabilir.
        Codable: Bu protokol, yapının JSON gibi formatlarda kolayca kodlanmasını ve kodunun çözülmesini sağlar. Yani bu yapı kolayca bir JSON verisine dönüştürülebilir ya da bir JSON verisinden oluşturulabilir.*/
        
    struct Coordinates: Hashable, Codable {
        
        /*Coordinates yapısının iki anahtar değişkeni vardır:
         
         latitude: Double: Bu, coğrafi enlem (latitude) değerini tutar. Enlem, bir yerin ekvatora olan mesafesini gösterir ve kuzey-güney yönünde ölçülür.
         longitude: Double: Bu, coğrafi boylam (longitude) değerini tutar. Boylam, bir yerin başlangıç meridyenine (Greenwich meridyeni) olan mesafesini gösterir ve doğu-batı yönünde ölçülür.

         */
        var latitude: Double
        var longitude: Double
        
        
    }
}
    
 
