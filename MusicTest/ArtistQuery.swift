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
    var artistTitle: String?
//    var albumsCount: Int
//    var songsCount: Int
}

class ArtistQuery {
    
    func get() -> [ArtistInfo] {
        var artists: [ArtistInfo] = []
        
        let query: MPMediaQuery = MPMediaQuery.artistsQuery()
//        query.groupingType = MPMediaGrouping.AlbumArtist
        let items: [MPMediaItemCollection] = query.collections!
        
        var title: String?
//        var aCount: Int? // albums
//        var sCount: Int // songs
        
        for artist in items {
            title = artist.representativeItem?.albumArtist
//            let artist = artist.representativeItem?.albumArtist
//            title = artist
//            print("title: ", title)
//            aCount = artist.
//            aCount = (artist.valueForProperty(MPMediaItemPropertyAlbumTitle)?.count)!
//            print("aCount: ", aCount)
            
            
//            let artistInfo: ArtistInfo = ArtistInfo(artistTitle: title, albumsCount: <#T##Int#>, songsCount: <#T##Int#>)
            let artistInfo: ArtistInfo = ArtistInfo(artistTitle: title)
            
            artists.append(artistInfo)
            
        }
        
        return artists
    }
}
