//
//  ImageLoader.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/29/21.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject{
    @Published var downloadImage: UIImage? = nil
    
}

extension ImageLoader{
    func load(_ urlString: String){
        guard let url = URL(string: urlString) else {
            fatalError("Error")
        }
        Constrant.session.dataTask(with: url, completionHandler: imageDataHandler).resume()
    }
    func imageDataHandler(data: Data?, res: URLResponse?, error: Error?){
        guard let data = data, error == nil else{
            fatalError("Unable to get image")
        }
            DispatchQueue.main.async {
                self.downloadImage = UIImage(data: data)
            }
    }
    
    
}
