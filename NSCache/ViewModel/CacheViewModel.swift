//
//  CacheViewModel.swift
//  NSCache
//
//  Created by Vladimir Kravets on 01.11.2023.
//

import SwiftUI

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cacheImage: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "st-mary-lake-and-wild-goose-island-in-glacier-national-park-1928877"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    
    func saveToCache() {
        guard
            let image = startingImage else {return}
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
        
    }
    
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cacheImage = returnedImage
            infoMessage = "Got image from Cache"
        } else {
            infoMessage = "Cache is Empty"
            cacheImage = nil
        }
        
    }
}


