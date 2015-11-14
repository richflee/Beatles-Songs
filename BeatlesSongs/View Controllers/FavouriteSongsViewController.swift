//
//  FavouriteSongsViewController.swift
//  BeatlesSongs
//
//  Created by Richard Lee on 29/10/2015.
//  Copyright © 2015 Richard Lee. All rights reserved.
//

import UIKit

class FavouriteSongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView! {
    
        didSet {
        
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var songs:[String] = []
    let songsReuseIdentifier = "songsCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songs.append("Yesterday")
        songs.append("Yellow Submarine")
        songs.append("Help!")
        songs.append("Nowhere man")
        songs.append("Glass onion")
        songs.append("Julia")
        songs.append("Ticket to Ride")
        songs.append("Here comes the sun")
        songs.append("Come together")
        songs.append("A day in the life")
        songs.append("Michelle")
        
        
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
        
        let rand:Int  = Int(arc4random_uniform(2))
        print(rand)
        
        cell.songLabel.text = songs[indexPath.row]
        
        cell.markAsRead(Bool(rand))
        
        return cell
    }
    
    
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let songTitle = songs[indexPath.row]
        
        let songViewController = SongViewController(nibName:"SongViewController", bundle:nil)
        songViewController.songTitle = songTitle
        
        navigationController?.pushViewController(songViewController, animated: true)
    }

}
