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
        
        let query: MPMediaQuery = MPMediaQuery.playlistsQuery()
//        let playlistItems: [MPMediaItemCollection] = playlistQuery.collections! as [MPMediaItemCollection]
        query.groupingType = .Playlist
        let items = query.collections!
        
        var title: String = ""
        var count: Int
        
//        for playlist in items {
        for playlist in items {
            title = playlist.valueForProperty(MPMediaPlaylistPropertyName) as! String
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
    func getPlaylistSongs(playlist: MPMediaItemCollection) {
//        var items: [MPMediaItem] = playlist.items
        let items = playlist.items
        
        var title: String?
        var artist: String?
        
        for song in items {
            title = song.title
            artist = song.artist
            
            print("song title: ", title, " artist: ", artist)
        }
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
