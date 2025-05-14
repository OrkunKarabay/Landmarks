//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Owsito on 15.10.2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    /*Bir model örneği oluşturmak için LandmarksApp'ı güncelleyin ve bunu ortam(_:) değiştiricisini kullanarak ContentView'a sağlayın.Bir model nesnesini, bir görünüm içindeki özellikleri başlatmak için kullandığınız şekilde başlatmak için @State niteliğini kullanın. Tıpkı SwiftUI'nin görünümün ömrü boyunca bir görünümdeki durumu yalnızca bir kez başlatması gibi, bir uygulamadaki durumu da uygulamanın ömrü boyunca yalnızca bir kez başlatır.*/

    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            LandmarkList()
            //
                .environment(modelData)
        }
    }
}
