//
//  APOD.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/22/21.
//

import Foundation

struct LatestPhotosWrapper: Codable {
    let latestPhotos: [LatestPhoto]
    
    enum CodingKeys: String, CodingKey {
        case latestPhotos = "latest_photos"
    }
}
struct LatestPhoto: Identifiable, Codable{
    let id = UUID()
    let sol: Int
    let imgSrc: String
    let earthDate: String

    enum CodingKeys: String, CodingKey {
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case sol
      
    }
}
