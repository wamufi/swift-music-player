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
    var artistAlbums: [AlbumInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        artists = artistQuery.getList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAlbum" {
            let controller = segue.destinationViewController as! DetailViewController
            controller.navigationItem.leftItemsSupplementBackButton = true
            controller.albums = artistAlbums
        }
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
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        artistAlbums = artistQuery.getArtistAlbms(artists[indexPath.row].artistItemCollection)
        performSegueWithIdentifier("showAlbum", sender: self)
    }
}

