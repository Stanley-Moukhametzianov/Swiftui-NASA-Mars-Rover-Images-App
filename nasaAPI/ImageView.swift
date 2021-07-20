//
//  ImageView.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/29/21.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader = ImageLoader()
    
    init(_ url: String){
        self.imageLoader.load(url)
    }
    var body: some View {
        if let image = imageLoader.downloadImage{
            return Image(uiImage: image).resizable()
        }else{
            return Image(systemName:"photo").resizable()
        }
    }
}


