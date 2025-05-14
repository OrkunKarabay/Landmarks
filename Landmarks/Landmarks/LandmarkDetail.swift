import SwiftUI


struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }



    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            MapView(coordinate: landmark .locationCoordinate)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                
                /*Gövde özelliğinin içine, bir Bindablesarmalayıcı kullanarak model verilerini ekleyin. Yer işaretinin adını HStackyeni bir ; ile gömün ve dolar işareti ( ) ile özelliğe bir bağlama sağlayın .FavoriteButtonisFavorite$
                 
                 Model nesnenizde saklanan dönüm noktasının özelliğinin düğme tarafından güncellenmesini sağlamak için nesneyle birlikte kullanın .landmarkIndexmodelDataisFavorite

*/
                        HStack {
                                    Text(landmark.name)
                                        .font(.title)
                                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                }



                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    //LandmarkDetail görünümünü ortamdaki ModelData nesnesiyle çalışacak şekilde güncelleyin.
    let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[0])
            .environment(modelData)
    }

