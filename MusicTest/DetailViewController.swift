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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 0
        
        if (songs.count > 0) {
            count = songs.count
        } else if (albums.count > 0) {
            count = albums.count
        }
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        if (songs.count > 0) {
            cell.textLabel?.text = songs[(indexPath as NSIndexPath).row].songTitle
            cell.detailTextLabel?.text = songs[(indexPath as NSIndexPath).row].songArtist
        } else if (albums.count > 0) {
            cell.textLabel?.text = albums[(indexPath as NSIndexPath).row].albumTitle
            cell.detailTextLabel?.text = albums[(indexPath as NSIndexPath).row].albumArtist
        }
        
        return cell
    }
}
