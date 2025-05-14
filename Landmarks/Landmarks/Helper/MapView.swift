//
//  SwiftUIView2.swift
//  Landmarks
//
//  Created by Owsito on 15.10.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        //Varsayılan görünümü , bölgeyle başlattığınız bir kamera konumunu alan Textbir görünümle değiştirin.Map
        /*Haritanın başlatıcısını, değer değiştiğinde güncellenecek şekilde konum girişi alan bir başlatıcıyla değiştirin.
         
         Bu yeni başlatıcı Binding, değere çift yönlü bir bağlantı olan bir konuma a bekler. .constant()Burada bir bağlama kullanın çünkü birisi haritayla etkileşime girerek konumu değiştirdiğinde bunu algılaması gerekmez.MapView*/
        Map(position: .constant(.region(region)))
    }
  
    //Haritanın bölge bilgilerini tutan özel bir hesaplanmış değişken oluşturun.
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            
    /*SwiftUI coordinatebu görünüme gelen girdinin değiştiğini fark eder ve görünümü güncellemek için gövdeyi tekrar değerlendirir. Bu da regionyeni giriş değerini kullanarak yeniden hesaplar.*/
            center: coordinate,
            
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
