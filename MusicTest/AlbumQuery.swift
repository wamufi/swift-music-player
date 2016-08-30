//
//  AlbumQuery.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 08/26/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit
import MediaPlayer

struct AlbumInfo {
    var albumTitle: String?
    var albumArtist: String?
}

class AlbumQuery {
    func get() -> [AlbumInfo] {
        var albums: [AlbumInfo] = []
        
        let query: MPMediaQuery = MPMediaQuery.albumsQuery()
        let items: [MPMediaItemCollection] = query.collections!
        
        var title: String?
        var artist: String?
        
        for album in items {
            title = album.representativeItem?.albumTitle
            artist = album.representativeItem?.albumArtist
            
            let albumInfo: AlbumInfo = AlbumInfo(albumTitle: title, albumArtist: artist)
            albums.append(albumInfo)
        }
        
        return albums
    }
}
