//
//  SearchViewModel.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/25/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    var controller: SearchViewController
    let requestMaker = RequestMaker()
    
    init(viewController: SearchViewController){
        controller = viewController
    }
    
    func checkIfSearchIsValid(searchedTerm: String){
        let searchedTermToValidate = searchedTerm.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if(searchedTermToValidate.isEmpty){
            controller.showEmptyAlert()
        } else {
            let sanitizedString = searchedTermToValidate.replacingOccurrences(of: " ", with: "%20")
            searchMovie(searchedTerm: sanitizedString)
            self.controller.sanitizedSearchTerm = sanitizedString
            self.controller.performSegue(withIdentifier: "searchToResults", sender: nil)
        }
    }
    
    func searchMovie(searchedTerm: String){
        requestMaker.requestMovies(withType: "Results", pageToRequest: 1, searchTerm: searchedTerm)
    }
}
