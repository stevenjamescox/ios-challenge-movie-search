//
//  SearchResultsTableViewController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate? = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchText = searchBar.text ?? ""
        
        MovieController.fetchMovies(searchText) { (movies) in
            dispatch_async(dispatch_get_main_queue(), {
                
                MovieController.sharedController.movies = movies
                self.tableView.reloadData()
            })
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.sharedController.movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? CustomTableViewCell
        
        let movie = MovieController.sharedController.movies[indexPath.row]
        
        cell?.loadCellContents(movie)
        
        return cell ?? UITableViewCell()
    }
    
}
