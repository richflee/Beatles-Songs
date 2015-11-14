//
//  SongViewController.swift
//  BeatlesSongs
//
//  Created by Richard Lee on 3/11/2015.
//  Copyright © 2015 Richard Lee. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    var songTitle: String?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let title = songTitle {
            titleLabel.text = title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    

}
