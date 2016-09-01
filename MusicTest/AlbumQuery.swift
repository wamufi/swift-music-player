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
    var albumItemCollection: MPMediaItemCollection
}

class AlbumQuery {
    func getList() -> [AlbumInfo] {
        var albums: [AlbumInfo] = []
        
        let query: MPMediaQuery = MPMediaQuery.albumsQuery()
        let items: [MPMediaItemCollection] = query.collections!
        
        var title: String?
        var artist: String?
        
        for album in items {
            title = album.representativeItem?.albumTitle
            artist = album.representativeItem?.albumArtist
            
            let albumInfo: AlbumInfo = AlbumInfo(albumTitle: title, albumArtist: artist, albumItemCollection: album)
            albums.append(albumInfo)
        }
        
        return albums
    }
    
    func getAlbumSongs(album: MPMediaItemCollection) -> [SongInfo] {
        var songs: [SongInfo] = []
        
        let items = album.items
        
        var title: String?
        var artist: String?
        var album: String?
        var duration: NSTimeInterval?
        var releaseDate: String?
        
        for song in items {
            title = song.title
            artist = song.artist
            album = song.albumTitle
            duration = song.playbackDuration
            
            let songInfo: SongInfo = SongInfo(songTitle: title, songArtist: artist, songAlbum: album)
            songs.append(songInfo)
        }
        
        return songs
    }
}
