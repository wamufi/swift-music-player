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
        return songs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = songs[indexPath.row].songTitle
        cell.detailTextLabel?.text = songs[indexPath.row].songArtist
        
        return cell
    }
}