//
//  MovieTableViewController.swift
//  Movie List
//
//  Created by user162867 on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {
    
    var movieList: [Movie] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMovieViewSegue" {
            guard let addMovieVC = segue.destination as? AddMovieViewController else { return }
            
            addMovieVC.delegate = self
        }
    }

}

extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableVIew: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { fatalError("Unable to dequeue cell")}
    
        let movie = movieList[indexPath.row]
        
        //This triggers the didSet so we don't need to call cell.updateView()
        cell.movie = movie
        
        return cell
    }
    
}

extension MovieTableViewController: AddMovieDelegate {
    func movieWasCreated(movie: Movie) {
        movieList.append(movie)
        tableView.reloadData()
    }
}

extension AddMovieViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
