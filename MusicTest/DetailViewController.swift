//
//  DetailViewController.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 08/31/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var songs: [SongInfo] = []
    var albums: [AlbumInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 0
        
        if (songs.count > 0) {
            count = songs.count
        } else if (albums.count > 0) {
            count = albums.count
        }
        
        return count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        if (songs.count > 0) {
            cell.textLabel?.text = songs[indexPath.row].songTitle
            cell.detailTextLabel?.text = songs[indexPath.row].songArtist
        } else if (albums.count > 0) {
            cell.textLabel?.text = albums[indexPath.row].albumTitle
            cell.detailTextLabel?.text = albums[indexPath.row].albumArtist
        }
        
        return cell
    }
}