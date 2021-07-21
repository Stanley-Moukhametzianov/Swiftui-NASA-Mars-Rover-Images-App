
# :zap: Swiftui-NASA-Mars-Rover-Images-App

* App using Swift 5, to view data from the official [NASA API](https://api.nasa.gov/index.html#getting-started).
* Uses a grid to display the latest Mars images from the perseverance rover.
* **Note:** to open web links in a new window use: _ctrl+click on link_

## :page_facing_up: Table of contents

* [:zap: Swiftui-NASA-Mars-Rover-Images-App](#zap-Swiftui-NASA-Mars-Rover-Images-App)
  * [:page_facing_up: Table of contents](#page_facing_up-table-of-contents)
  * [:books: General info](#books-general-info)
  * [:camera: Screenshots](#camera-screenshots)
  * [:floppy_disk: App Setup](#floppy_disk-app-setup)
  * [:computer: Code Examples](#computer-code-examples)
  * [:cool: Features](#cool-features)
  * [:file_folder: License](#file_folder-license)
  * [:envelope: Contact](#envelope-contact)

## :books: General info

* NASA Mars Rover Photos from the [NASA API](https://api.nasa.gov/). Note video function requires npm module [safe-pipe](https://www.npmjs.com/package/safe-pipe)
* [NASA Mars Photos API github repo](https://github.com/chrisccerami/mars-photo-api)
* This mobile app was created following the MVVM framework. The Model is responsible for making calls to the API and fetching the json data. 


## :camera: Screenshots

<p float="left">
  <img src="https://user-images.githubusercontent.com/66892566/126558031-c9765540-08a8-4407-8207-33a032132d15.PNG" width="300" />
  <img src="https://user-images.githubusercontent.com/66892566/126558394-515780a6-4d3c-4369-b5b1-f55377487d2a.PNG" width="300" /> 
  <img src="https://user-images.githubusercontent.com/66892566/126558591-1c10a034-6588-45d9-ab11-74177396d457.PNG" width="300" /> 
</p>

## :floppy_disk: App Setup

* Get yourself a [NASA API key](https://api.nasa.gov/index.html#getting-started) from Nasa
* Once you copy the Xcode peoject you will still need to create an additional swift file. The file should be called Constrant.swift and have the code

```swift

import Foundation

class Constrant{
    static var url : URL{
        guard let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos?api_key=") else{ fatalError()}
        
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
```
* Make sure to enter your uniqe API key in the url after "api_key=". There should not be any space between the = and the API key. 
Ex. "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos?api_key=hyfMbZoL58adaasdadad4234"

## :computer: Code Examples

* ` API.swift` extract: gets data from Nasa API using APIKEY supplied by them.

```swift

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

```

## :cool: Features
* If you want to save any of the images to your iphone photo library you can do so by holding down on the image for two seconds. Then 
you will be asked for permission to access your photos and the image will be saved. 


## :file_folder: License

* This project is licensed under the terms of the MIT license.

## :envelope: Contact

* Repo created by [Stanley Moukhametzianov](https://github.com/Stanley-Moukhametzianov?tab=repositories), email: stanleymoukh@gmail.com
