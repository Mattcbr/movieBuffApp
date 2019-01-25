//
//  MovieCollectionViewCell.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/23/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieThumbnailImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieLoadingIndicator: UIActivityIndicatorView!
    
    func setupForMovie(Movie: MovieModel) {
        movieLoadingIndicator.hidesWhenStopped = true
        movieNameLabel.text = Movie.title
        movieThumbnailImageView.image = Movie.thumbnail
        if(!Movie.isThumbnailLoaded){
            movieLoadingIndicator.startAnimating()
        } else {
            movieLoadingIndicator.stopAnimating()
        }
    }
}
