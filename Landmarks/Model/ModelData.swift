//
//  ModelData.swift
//  Landmarks
//
//  Created by Owsito on 15.10.2024.
//

import Foundation


/*Makroyu kullanarak yeni bir model türü bildirin Observable().
 
 SwiftUI, yalnızca gözlemlenebilir bir özellik değiştiğinde ve görünümün gövdesi özelliği doğrudan okuduğunda bir görünümü günceller.*/
@Observable
class ModelData {
    //Nesne oluştu
    var landmarks: [Landmark] = load("landmarkData.json")
    // Model Datama Hike ı ekledim 
    var likes: [Hike] = load("hikeData.json")
}

 func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
