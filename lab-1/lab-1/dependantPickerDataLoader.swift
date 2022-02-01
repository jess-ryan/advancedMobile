//
//  dependantPickerDataLoader.swift
//  lab-1
//
//  Created by Jess Ryan on 1/31/22.
//

import Foundation

class DataLoader{
    
    var allData = [ArtistAlbums]()
    
    func loadData(fileName: String){
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            
            do{
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([ArtistAlbums].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func getArtists() -> [String]{
        var artists = [String]()
        for artist in allData{
            artists.append(artist.name)
        }
        return artists
    }
    
    func getAlbums(index:Int) -> [String]{
        return allData[index].albums
    }
    
    
}
