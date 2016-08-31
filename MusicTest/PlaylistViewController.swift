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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
//            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
            let controller = segue.destinationViewController as! DetailViewController
            controller.navigationItem.leftItemsSupplementBackButton = true
            controller.songs = playlistSongs
        }
    }

    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = playlists[indexPath.row].playlistTitle
        cell.detailTextLabel?.text = String(playlists[indexPath.row].songsCount)+" Songs"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        playlistSongs = playlistQuery.getPlaylistSongs(playlists[indexPath.row].playlistItemCollection)
        performSegueWithIdentifier("showDetail", sender: indexPath)
    }
}

