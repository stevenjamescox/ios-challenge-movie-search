//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.sharedController.getMovies { (movies) in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                MovieController.sharedController.movies = movies
                self.tableView.reloadData()
            })

    }

    }
    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.sharedController.movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)
        let movies = MovieController.sharedController.movies[indexPath.row]
        cell.textLabel?.text = "\(movies.title)"
        return cell

    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
