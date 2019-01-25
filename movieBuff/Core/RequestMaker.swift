//
//  RequestMaker.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/23/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

protocol RequestDelegate: class{
    func didLoadPopularMovies(movies:[MovieModel] )
//    func didLoadPopularMoviesWithThumbnail(movies:[MovieModel])
    func didFailToLoadPopularMovies(withError error: Error)
    func didFailToLoadGenres(withError error: Error)
}

class RequestMaker {
    
    weak var delegate: RequestDelegate?
    let apiKey = "6f0d4dc1727facb3ebd5ac88b77494df"
    let responseParser = Parser.shared
    
    func requestMovies(withType type:String, pageToRequest: Int, searchTerm: String?) {
        var requestURL = String()
        
        switch type {
        case "Featured":
            requestURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=\(pageToRequest)"
        case "Top Rated":
            requestURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=en-US&page=\(pageToRequest)"
        case "Results":
            requestURL = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(searchTerm!)&page=\(pageToRequest)&include_adult=false"
        default:
            requestURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=\(pageToRequest)"
        }
        
        Alamofire.request(requestURL).responseJSON{ response in
            switch response.result{
                
            case .success(let JSON):
                let moviesArray = self.responseParser.parseMovies(response: JSON)
                self.delegate?.didLoadPopularMovies(movies: moviesArray)
            case .failure(let error):
                self.delegate?.didFailToLoadPopularMovies(withError: error)
                print("Error:\(error.localizedDescription)")
            }
        }
    }
    
    func requestImage(imagePath: String, completion: @escaping (_ image: UIImage) -> Void) {
        let fullURL = "https://image.tmdb.org/t/p/w500/\(imagePath)"
        Alamofire.request(fullURL).responseImage { response in
            if let image = response.result.value {
                completion(image)
            }
        }
    }
    
    func requestGenres() {
        let genresAPIURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US"
        Alamofire.request(genresAPIURL).responseJSON{ response in
            switch response.result{
                
            case .success(let JSON):
                self.responseParser.parseGenres(response: JSON)
            case .failure(let error):
                self.delegate?.didFailToLoadGenres(withError: error)
            }
        }
    }
}
