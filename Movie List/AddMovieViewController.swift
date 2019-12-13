//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by user162867 on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// DELEGATOR
protocol AddMovieDelegate {
    // We will pass the movie that was created into this function
    func movieWasCreated(movie: Movie)
}

class AddMovieViewController: UIViewController {

    @IBOutlet weak var newMovie: UITextField!
    
    // Anything that conforms to the AddMovieDelegate protocol can be set as the delegate of this VC
    var delegate: AddMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        guard let movieName = newMovie.text else { return }
    
        var movie = Movie(title: movieName, isSeen: true)
        
        delegate?.movieWasCreated(movie: movie)
        
        self.newMovie.text = ""
        
        dismiss(animated: true, completion: nil)
    }
    
}
