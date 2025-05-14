import SwiftUI
import CoreLocation

struct ContentView: View {
    var body: some View {
        VStack {
            // MapView'e doğru parametre sağlayalım
            MapView(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
                .frame(height: 300)
            
            // CircleImage'e bir Image parametresi sağlayalım
            CircleImage(image: Image(systemName: "turtlerock"))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        /*Model nesnesini ortama eklemek için ContentView önizlemesini güncelleyin; böylece nesne herhangi bir alt görünümde kullanılabilir hale gelir.
         
         Herhangi bir alt görünüm ortamda bir model nesnesi gerektiriyorsa, ancak önizlediğiniz görünümde ortam(_:) değiştiricisi yoksa önizleme başarısız olur.*/
        .environment(ModelData())
}

