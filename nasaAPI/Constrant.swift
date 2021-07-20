//
//  Constrant.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/22/21.


import Foundation

class Constrant{
    static var url : URL{
        guard let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos?api_key=hyfMbZoL58Gy00L2v5MO2slbnUXdhjvOXbvl6gsG") else{ fatalError()}
        
        return url
        
    }
    
    static var session:URLSession {
        let session = URLSession(configuration: .default)
        return session
        
    }
    static var request: URLRequest{
        let req = URLRequest(url: url)
        return req
        
    }
    
    static var decoder: JSONDecoder{
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
        
    }
    
}
