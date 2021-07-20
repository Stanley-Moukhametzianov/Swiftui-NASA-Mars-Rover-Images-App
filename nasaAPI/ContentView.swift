//
//  ContentView.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
   
    
    var body: some View {
        NavigationView{
            GeometryReader{ geo in
                ScrollView{
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 3){
                        ForEach(viewModel.apod){ apod in
                            ImageView(apod.imgSrc)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width/3,height: geo.size.width/3)
                                .onLongPressGesture {
                                    saveImage(url: apod.imgSrc)
                                }
                        }
                    }
                }
                
            }.navigationTitle(Text("Latest Mars Images"))
        }
    }
    
    
    func getImage(_ imageUrlString: String) -> UIImage{
        let imageUrl = URL(string: imageUrlString)!
        
        let imageData = try! Data(contentsOf: imageUrl)
        
        let image = UIImage(data: imageData)
        return image!
    }
    func saveImage(url : String){
        UIImageWriteToSavedPhotosAlbum(getImage(url), nil, nil, nil)
    }
}


