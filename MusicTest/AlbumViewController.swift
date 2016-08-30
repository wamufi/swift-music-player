//
//  AlbumViewController.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 08/26/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit

class AlbumViewController: UITableViewController {
    
    var albums: [AlbumInfo] = []
    var albumQuery: AlbumQuery = AlbumQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albums = albumQuery.get()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = albums[indexPath.row].albumTitle
        cell.detailTextLabel?.text = albums[indexPath.row].albumArtist
        
        return cell
    }
}