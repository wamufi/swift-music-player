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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            let controller = segue.destination as! DetailViewController
            controller.navigationItem.leftItemsSupplementBackButton = true
            controller.albums = artistAlbums
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = artists[(indexPath as NSIndexPath).row].artistTitle
//        cell.detailTextLabel?.text = String(playlists[indexPath.row].songsCount)+" Songs"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        artistAlbums = artistQuery.getArtistAlbms(artists[(indexPath as NSIndexPath).row].artistItemCollection)
        performSegue(withIdentifier: "showAlbum", sender: self)
    }
}

