//
//  SongTableViewCell.swift
//  BeatlesSongs
//
//  Created by Richard Lee on 31/10/2015.
//  Copyright © 2015 Richard Lee. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    let readBackgroundColor = UIColor.yellowColor()
    let unreadBackgroundColor = UIColor.whiteColor()
    
    @IBOutlet var songLabel:UILabel! {
    
        didSet {
            
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedBgView:UIView = UIView(frame: contentView.frame)
        selectedBgView.backgroundColor = UIColor.orangeColor()
        selectedBackgroundView = selectedBgView
        
        let bgView:UIView = UIView(frame: contentView.frame)
        bgView.backgroundColor = UIColor.whiteColor()
        backgroundView = bgView
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func markAsRead(read: Bool) {
    
        backgroundView?.backgroundColor = (read) ? readBackgroundColor : unreadBackgroundColor
    }

}
