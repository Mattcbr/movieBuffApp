//
//  MoviesViewModel.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/23/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation
import UIKit

class MoviesViewModel: RequestDelegate{
    
    let requestMaker = RequestMaker()
    var controller: MoviesViewController
    var moviesArray = [MovieModel]()
    var pageToRequest: Int = 1
    
    init(viewController: MoviesViewController){
        controller = viewController
        
        self.requestMaker.delegate = self
        self.requestMaker.requestMovies(withType: self.controller.screenType, pageToRequest: self.pageToRequest, searchTerm: self.controller.searchedTerm)
        self.controller.isLoadingData = true
        self.requestMaker.requestGenres()
    }
    
    func didLoadPopularMovies(movies: [MovieModel]) {
        if (moviesArray.count == 0){
            self.moviesArray = movies
        } else {
            self.moviesArray.append(contentsOf: movies)
        }
        controller.didLoadPopularMovies()
    }
    
    /*func didLoadPopularMoviesWithThumbnail(movies: [MovieModel]) {
        if (moviesArray.count == 0){
            self.moviesArray = movies
        } else {
            self.moviesArray.append(contentsOf: movies)
        }
        controller.didLoadPopularMovies()
    }*/
    
    func didFailToLoadPopularMovies(withError error: Error) {
        print("Failed to load more movies with error: \(error.localizedDescription)")
        controller.failedToLoad(withType: "Popular Movies")
    }
    
    func didFailToLoadGenres(withError error: Error) {
        print("Faile to load movie genres:\(error.localizedDescription)")
        controller.failedToLoad(withType: "Movie Genres")
    }
    
    func requestMoreMovies() {
        pageToRequest = pageToRequest + 1
        self.requestMaker.requestMovies(withType: self.controller.screenType, pageToRequest: pageToRequest, searchTerm: self.controller.searchedTerm)
    }
}
