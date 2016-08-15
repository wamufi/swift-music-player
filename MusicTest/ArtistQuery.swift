//
//  ArtistQuery.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 08/08/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit
import MediaPlayer

struct ArtistInfo {
    var artistTitle: String
    var albumsCount: Int
    var songsCount: Int
}

class ArtistQuery {
    
//    func get() -> [ArtistInfo] {
    func get() {
        var artists: [ArtistInfo] = []
        
        let query: MPMediaQuery = MPMediaQuery.artistsQuery()
//        query.groupingType = MPMediaGrouping.AlbumArtist
        let items: [MPMediaItemCollection] = query.collections!
        
        print("query: ", query)
        
        var title: String = ""
        var aCount: Int
        var sCount: Int
        
        for artist in items {
//            title = artist.valueForProperty(MPMediaItemPropertyArtist) as! String
            print("artists: ", artist.representativeItem?.albumArtist)
        }
    }
}
