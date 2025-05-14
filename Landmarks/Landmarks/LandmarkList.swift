import SwiftUI


struct LandmarkList: View {
    
    /* Başlangıç ​​değeri olarak ayarlanmış bir @Stateözellik ekleyin .showFavoritesOnlyfalse
     
     Çünkü durum özelliklerini, bir görünüme ve onun alt görünümlerine özgü bilgileri tutmak için kullandığınızdan, durumu her zaman olarak oluşturursunuz private.*/
    @Environment(ModelData.self) var modelData
        @State private var showFavoritesOnly = false
    
    /*Özelliği ve her değeri kontrol ederek dönüm noktaları listesinin filtrelenmiş bir versiyonunu hesaplayın .showFavoritesOnlylandmark.isFavorite
     
*/
    
    
    var filteredLandmarks: [Landmark] {
        //Simgesel noktaları filtrelerken veri olarak kullanın .modelData.landmarks
        
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }


    var body: some View {
        NavigationSplitView {
                
            //. içindeki simge yapıların listesinin filtrelenmiş versiyonunu kullanın List.
            List {
                    /*ToggleGörünümün ilk çocuğu olarak bir görünüm ekleyin Listve .'a bir bağlama geçirin .showFavoritesOnly
                     
                     $Bir durum değişkenine veya onun özelliklerinden birine bağlanmak için öneki kullanırsınız .*/
                
                        Toggle(isOn: $showFavoritesOnly) {
                                    Text("Favorites only")
                                }

                /*Yer işaretlerini satırlara dönüştürmek için iç içe geçmiş bir grup oluşturun .ForEach
                 
                 Statik ve dinamik görünümleri bir listede birleştirmek veya iki veya daha fazla farklı dinamik görünüm grubunu birleştirmek için, veri koleksiyonunuzu 'a geçirmek yerine türünü kullanın .ForEachList*/
                          ForEach(filteredLandmarks) { landmark in
                              NavigationLink {
                                  LandmarkDetail(landmark: landmark)
                              } label: {
                                  LandmarkRow(landmark: landmark)
                              }
                          }
                      }
                        //Toggle animasyon ekledik
                      .animation(.default, value: filteredLandmarks)
                      .navigationTitle("Landmarks")
                } detail: {
                    Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
        .environment(ModelData())
}
