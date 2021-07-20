//
//  ViewModel.swift
//  nasaAPI
//
//  Created by Stanley Moukh on 5/25/21.
//

import Foundation
import SwiftUI
import Combine

class ViewModel: ObservableObject{
    @Published var apod: [LatestPhoto] = []
    init(){
        self.fetch()
        
    }
}
extension ViewModel{
    func fetch(){
        API.getImage{apod in
            self.apod = apod
            
        }
        
    }
    
}

