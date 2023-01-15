//
//  DetailsViewController.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/24/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImageViewController: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var FavoritesButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var selectedMovie: MovieModel?
    var model: DetailsViewModel?
    var isFavorite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = DetailsViewModel(viewController: self)
        
        self.navigationItem.title = "\(selectedMovie!.title)"
        
        setupMovieInfo()
        setupMovieImage()
        if(selectedMovie!.genresIDArray.count > 0){
            setupGenreInfo()
        } else {
            movieGenresLabel.text = "No genres available :("
        }
        setupFavoriteInfo()
        
    }
    
    func setupMovieInfo(){
        movieNameLabel.text = selectedMovie?.title
        movieYearLabel.text = "\(selectedMovie!.releaseYear.year!)"
        movieGenresLabel.text = "Loading Genres..."
        movieDescriptionLabel.text = selectedMovie?.overview
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.sizeToFit()
    }
    
    func setupMovieImage() {
        guard let thumbPath = selectedMovie?.thumbnailPath, let url = URL(string: "https://image.tmdb.org/t/p/w500/\(thumbPath)") else { return }
        posterImageViewController.af.setImage(withURL: url)
    }
    
    func setupGenreInfo(){
        if(selectedMovie?.genresStringSet.count == 0){
            model?.getGenres(forMovie: selectedMovie!)
        }
        let genresString = NSMutableString()
        selectedMovie?.genresStringSet.forEach { genre in
            if (genre != ""){
                genresString.append("\(genre), ")
            }
        }
        
        let genreToDisplay = genresString.substring(to: genresString.length-2)
        movieGenresLabel.text = genreToDisplay as String
        movieGenresLabel.numberOfLines = 0
        movieGenresLabel.sizeToFit()
    }
    
    func setupFavoriteInfo(){
        isFavorite = model!.verifyIfFavorite(selectedMovie: selectedMovie!)
        if (isFavorite){
            FavoritesButton.setImage(UIImage(named: "favorite_full_icon"), for: .normal)
        } else {
            FavoritesButton.setImage(UIImage(named: "favorite_empty_icon"), for: .normal)
        }
    }
    
    @IBAction func didPressFavoritesButton(_ sender: Any) {
        if (!isFavorite){
            FavoritesButton.setImage(UIImage(named: "favorite_full_icon"), for: .normal)
            model?.addToFavorites(selectedMovie: selectedMovie!)
        } else {
            let deleteMenu = UIAlertController(title: "Remove From Favorites", message: "Are you sure you want to remove \(selectedMovie!.title) from your favorites?", preferredStyle: UIAlertController.Style.actionSheet)
            let removeAction = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: { (action) in
                self.model?.remove(fromFavorites: self.selectedMovie!)
                self.FavoritesButton.setImage(UIImage(named: "favorite_empty_icon"), for: .normal)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            
            deleteMenu.addAction(removeAction)
            deleteMenu.addAction(cancelAction)
            
            self.present(deleteMenu, animated: true, completion: nil)
        }
    }
}
