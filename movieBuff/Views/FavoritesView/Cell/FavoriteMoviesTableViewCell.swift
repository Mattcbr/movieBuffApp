//
//  FavoriteMoviesTableViewCell.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/26/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class FavoriteMoviesTableViewCell: UITableViewCell {


    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupForMovie(Movie: MovieModel) {
        movieTitleLabel.text = Movie.title
        movieDescriptionLabel.text = Movie.overview
        moviePosterImageView.image = Movie.thumbnail
    }
}
