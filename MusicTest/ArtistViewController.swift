//
//  ArtistViewController.swift
//  MusicTest
//
//  Created by Hyunjin Kim on 08/08/16.
//  Copyright © 2016 Hyunjin Kim. All rights reserved.
//

import UIKit

class ArtistViewController: UITableViewController {
    
    var artists: [ArtistInfo] = []
    var artistQuery: ArtistQuery = ArtistQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        playlists = playlistQuery.get()
        artists = artistQuery.get()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = artists[indexPath.row].artistTitle
//        cell.detailTextLabel?.text = String(playlists[indexPath.row].songsCount)+" Songs"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
}

