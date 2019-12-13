//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by user162867 on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie : Movie? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var isSeenLabel: UIButton!
    
    func updateViews() {
        movieLabel.text = movie?.title
        
        if movie?.isSeen == true {
            isSeenLabel.setTitle("Seen", for: .normal)
        } else {
            isSeenLabel.setTitle("Not Seen", for: .normal)
        }
    }
    
    @IBAction func isSeenTapped(_ sender: Any) {
        
        if movie?.isSeen == true {
            movie?.isSeen = false
            updateViews()
        } else {
            movie?.isSeen = true
            updateViews()
        }
        
    }
}
