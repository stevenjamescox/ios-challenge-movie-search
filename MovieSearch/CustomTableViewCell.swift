//
//  CustomTableViewCell.swift
//  MovieSearch
//
//  Created by Steve Cox on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var movie: Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avgRatingLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    func loadCellContents(movie: Movie) {
        
        self.movie = movie
        
        titleLabel.text = movie.title
        avgRatingLabel.text = "Avg Rating: \(movie.voteAverage) out of 10"
        synopsisLabel.text = "Synposis: \(movie.overview)"
        
        posterImageView.image = UIImage()
        ImageController.fetchImage(movie.posterPathURL) {(image) in
           
            dispatch_async(dispatch_get_main_queue(),
            { self.posterImageView.image = image })
        }
    }
}