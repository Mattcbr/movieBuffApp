//
//  SearchViewController.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/25/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var model: SearchViewModel?
    var sanitizedSearchTerm: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = SearchViewModel(viewController: self)
        
        searchBar.placeholder = "Search for a Movie"
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        model?.checkIfSearchIsValid(searchedTerm: searchBar.text ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.searchController = nil
        self.tabBarController?.navigationItem.title = "Search"
    }
    
    @IBAction func showEmptyAlert(){
        let alert = UIAlertController(title: "Invalid Search", message: "Please type something so we can search for it", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationViewController = segue.destination as! MoviesViewController
        destinationViewController.isSearchResult = true
        destinationViewController.searchedTerm = sanitizedSearchTerm!
        
    }
    

}
