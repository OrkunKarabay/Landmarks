import SwiftUI


struct FavoriteButton: View {
    
    //Düğmenin geçerli durumunu belirten bir bağlama ekleyin ve önizleme için sabit bir değer sağlayın.isSet
    @Binding var isSet: Bool
    
    var body: some View {
        /*ButtonDurumu değiştiren ve durumuna göre görünümünü değiştiren bir eylemle oluşturun .isSet
         
         Düğmenin etiketi için sağladığınız başlık dizesi, etiket stilini kullandığınızda kullanıcı arayüzünde görünmez, ancak VoiceOver erişilebilirliği artırmak için bunu kullanır.iconOnly*/
        Button {
                    isSet.toggle()
                } label: {
                    Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(isSet ? .yellow : .gray)
                }
        }
}


#Preview {
    //Bağlayıcı özellik sarmalayıcısı, verileri depolayan bir özellik ile verileri görüntüleyen ve değiştiren bir görünüm arasında okuma ve yazma yapmanızı sağlar. Bir bağlama kullandığınız için, bu görünüm içinde yapılan değişiklikler veri kaynağına geri yayılır.
    

    FavoriteButton(isSet: .constant(true))
}

