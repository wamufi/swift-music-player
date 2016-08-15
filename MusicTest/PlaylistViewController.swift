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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playlists = playlistQuery.get()
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
        return playlists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = playlists[indexPath.row].playlistTitle
        cell.detailTextLabel?.text = String(playlists[indexPath.row].songsCount)+" Songs"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }
}

