//
//  ViewController.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 07/30/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit

class PlaylistViewController: UITableViewController {
    
    var playlists: [PlaylistInfo] = []
    var playlistQuery: PlaylistQuery = PlaylistQuery()
    var playlistSongs: [SongInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playlists = playlistQuery.getList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
//            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
            let controller = segue.destination as! DetailViewController
            controller.navigationItem.leftItemsSupplementBackButton = true
            controller.songs = playlistSongs
        }
    }

    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = playlists[(indexPath as NSIndexPath).row].playlistTitle
        cell.detailTextLabel?.text = String(playlists[(indexPath as NSIndexPath).row].songsCount)+" Songs"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        playlistSongs = playlistQuery.getPlaylistSongs(playlists[(indexPath as NSIndexPath).row].playlistItemCollection)
        performSegue(withIdentifier: "showDetail", sender: self)
    }
}

