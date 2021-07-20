//
//  API.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/22/21.
//

import Foundation

class API {
    class func getImage(_ onSuccess: @escaping ([LatestPhoto]) -> ()){
        Constrant.session.dataTask(with: Constrant.request){(data, res, err) in
            guard let data = data, err == nil else{
                fatalError()
            }
            do{
                let apod = try JSONDecoder().decode(LatestPhotosWrapper.self, from: data)
                
                
                DispatchQueue.main.async {
                    onSuccess(apod.latestPhotos)
                }
                
            }
            catch{
                print(error)
            }
            
        }.resume()
        
    }
}
