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
    var albumSongs: [SongInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albums = albumQuery.getList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as! DetailViewController
            controller.navigationItem.leftItemsSupplementBackButton = true
            controller.songs = albumSongs
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = albums[(indexPath as NSIndexPath).row].albumTitle
        cell.detailTextLabel?.text = albums[(indexPath as NSIndexPath).row].albumArtist
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        albumSongs = albumQuery.getAlbumSongs(albums[(indexPath as NSIndexPath).row].albumItemCollection)
        performSegue(withIdentifier: "showDetail", sender: self)
    }
}
