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
    var artistItemCollection: MPMediaItemCollection
}

class ArtistQuery {
    func getList() -> [ArtistInfo] {
        var artists: [ArtistInfo] = []
        
        let query: MPMediaQuery = MPMediaQuery.artistsQuery()
        query.groupingType = .AlbumArtist
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
            let artistInfo: ArtistInfo = ArtistInfo(artistTitle: title, artistItemCollection: artist)
            
            artists.append(artistInfo)
            
        }
        
        return artists
    }
    
    func getArtistAlbms(artist: MPMediaItemCollection) -> [AlbumInfo] {
        var albums: [AlbumInfo] = []
        
        let filterPredicate = MPMediaPropertyPredicate.init(value: artist.representativeItem?.artist, forProperty: MPMediaItemPropertyArtist)
        let query = MPMediaQuery()
        query.addFilterPredicate(filterPredicate)
        query.groupingType = .Album

        let items = query.collections!
    
        var artist: String?
        var albumTitle: String?
        
        for album in items {
            artist = album.representativeItem?.artist
            albumTitle = album.representativeItem?.albumTitle
            
            let albumInfo: AlbumInfo = AlbumInfo(albumTitle: albumTitle, albumArtist: artist, albumItemCollection: album)
            albums.append(albumInfo)
        }
    
        return albums
    }
}
