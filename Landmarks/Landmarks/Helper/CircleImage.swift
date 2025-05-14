//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Owsito on 15.10.2024.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
    
        image
        //Resme dairesel kırpma şekli uygulamak için bir çağrı ekleyin .clipShape(Circle())
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        //Gri çizgili bir daire daha oluşturun ve ardından bunu bir kaplama olarak ekleyerek görüntüye bir kenarlık verin.
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
                
            }
        //Daha sonra 7 nokta yarıçapında bir gölge ekleyin.
            .shadow(radius: 7)
    }
    
    
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
