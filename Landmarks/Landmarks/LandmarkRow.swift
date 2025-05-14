//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Owsito on 17.10.2024.
//
import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            //Metin görünümünden önce bir resim ve sonrasında bir boşluk ekleyerek satırı tamamlayın.
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
            
                Spacer()
        
           

            if landmark.isFavorite{
                /*Aralayıcıdan sonra, ifmevcut dönüm noktasının favori olup olmadığını test etmek için bir ifadenin içine bir yıldız resmi ekleyin.
                 
                 SwiftUI bloklarında, ifgörünümleri koşullu olarak eklemek için ifadeler kullanırsınız.*/

                Image(systemName: "star.fill")
                    // yıldız rengini ayarlarız
                    .foregroundColor(.yellow)
            }
        }
    }
}
/*inci önizlemeyi kaldırın ve bunun yerine satırın iki sürümünü bir Group.

Groupgörünüm içeriğini gruplamak için bir kapsayıcıdır. Xcode, grubun alt görünümlerini tuvalde tek bir önizleme olarak istiflenmiş şekilde işler.*/
#Preview {
    //LandmarkRow önizlemesini ModelData nesnesiyle çalışacak şekilde güncelleyin.
    let landmarks = ModelData().landmarks
     return Group {
         LandmarkRow(landmark: landmarks[0])
         LandmarkRow(landmark: landmarks[1])
     }}
