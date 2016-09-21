//
//  PlaylistQuery.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 07/30/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit
import MediaPlayer

struct PlaylistInfo {
    var playlistTitle: String
    //    var playlistImage: UIImage
    var songsCount: Int
    var playlistItemCollection: MPMediaItemCollection
}

class PlaylistQuery {
    func getList() -> [PlaylistInfo] {
//    func getPlaylist() {
        var playlists: [PlaylistInfo] = []
        
        let query: MPMediaQuery = MPMediaQuery.playlists()
//        let playlistItems: [MPMediaItemCollection] = playlistQuery.collections! as [MPMediaItemCollection]
        query.groupingType = .playlist
        let items = query.collections!
        
        var title: String = ""
        var count: Int
        
//        for playlist in items {
        for playlist in items {
            title = playlist.value(forProperty: MPMediaPlaylistPropertyName) as! String
            count = playlist.items.count
            
            
//            var songs: [MPMediaItem] = playlist.items
//            var song:
            
//            let playlistInfo: PlaylistInfo = PlaylistInfo(playlistTitle: title, playlistImage: artwork)
            let playlistInfo: PlaylistInfo = PlaylistInfo(playlistTitle: title, songsCount: count, playlistItemCollection: playlist)
//            getPlaylistSongs()
//            let playlistItems = playlist.items
//            for song in playlistItems {
//                print(song.valueForProperty(MPMediaItemPropertyTitle))
//            }
            
            playlists.append(playlistInfo)
        }
        
        
        return playlists
    }
    
//    func getPlaylistSongs(playlist: MPMediaPlaylist) {
    func getPlaylistSongs(_ playlist: MPMediaItemCollection) -> [SongInfo] {
//        var items: [MPMediaItem] = playlist.items
        
        var songs: [SongInfo] = []
        
        let items = playlist.items
        
        var title: String?
        var artist: String?
        var album: String?
        var duration: TimeInterval?
        
        for song in items {
            title = song.title
            artist = song.artist
            album = song.albumTitle
            duration = song.playbackDuration
            
            print("song title: ", title, " artist: ", artist, "duration: ", duration)
            let songInfo: SongInfo = SongInfo(songTitle: title, songArtist: artist, songAlbum: album)
            songs.append(songInfo)
        }
        
        return songs
    }
    
//    func getArtworks(forPlaylist playlist: MPMediaPlaylist) -> UIImage {
//        var artworkImage: UIImage
//        var artwork: MPMediaItemArtwork
//        let size: CGSize = CGSizeMake(30, 30)
//        let items: [MPMediaItem] = playlist.items as [MPMediaItem]
//        let song: MPMediaItem
//
//        for item in 1...4 {
//            artwork = item.artwork!
//            artworkImage = artwork.imageWithSize(size)!
//        }
//        
//        return artworkImage
//    }
}
