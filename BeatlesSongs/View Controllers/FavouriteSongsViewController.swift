//
//  FavouriteSongsViewController.swift
//  BeatlesSongs
//
//  Created by Richard Lee on 29/10/2015.
//  Copyright © 2015 Richard Lee. All rights reserved.
//

import UIKit

class FavouriteSongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    typealias beatlesSong = (title:String, viewed:Int)

    @IBOutlet var tableView: UITableView! {
    
        didSet {
        
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var songs:[beatlesSong] = []
    let songsReuseIdentifier = "songsCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let songTitles = [ "Yesterday", "Yellow Submarine", "Help!", "Nowhere man", "Glass onion", "Julia", "Ticket to Ride", "Here comes the sun", "Come together", "A day in the life", "Michelle" ]
        
        songTitles.forEach { (songTitle) -> () in
            
            let song = ( songTitle, Int(arc4random_uniform(2)) )
            songs.append(song)
        }
        
        
        let nib:UINib = UINib(nibName: "SongTableCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: songsReuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            
            
            tableView.deselectRowAtIndexPath(selectedIndexPath, animated:true)
        }
    }
    

    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:SongTableViewCell = tableView.dequeueReusableCellWithIdentifier(songsReuseIdentifier, forIndexPath: indexPath) as! SongTableViewCell
        
        cell.songLabel.text = songs[indexPath.row].title
        cell.markAsRead(Bool(songs[indexPath.row].viewed))
        
        return cell
    }
    
    
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var song = songs[indexPath.row]
        
        let songViewController = SongViewController(nibName:"SongViewController", bundle:nil)
        songViewController.songTitle = song.title
        song.viewed = 1
        
        songs[indexPath.row] = song
        
        let cell:SongTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as! SongTableViewCell
        cell.markAsRead(Bool(song.viewed))
        
        navigationController?.pushViewController(songViewController, animated: true)
    }

}
