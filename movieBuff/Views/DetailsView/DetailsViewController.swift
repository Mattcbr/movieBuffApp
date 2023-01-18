//
//  DetailsViewController.swift
//  movieBuff
//
//  Created by Matheus Queiroz on 1/24/19.
//  Copyright © 2019 mattcbr. All rights reserved.
//

import SwiftUI


// On this new structure we are missing the genders, the favorites button (with the delete action) and proper image. See how can we go about that
struct DetailsViewController: View {
    
    var selectedMovie: MovieModel
    var model: DetailsViewModel? //Maybe this will need to be revisited later
    var isFavorite: Bool = false
    
    var body: some View {
        VStack {
            Image("apple-touch-icon2")
            
            Text(selectedMovie.title)
                .padding()
            Text(selectedMovie.releaseDateString).padding()
            Text(selectedMovie.overview).padding(.horizontal, 16)
        }
    }
}

// Check how to make the preview work correctly
/*struct DetailsViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        DetailsViewController()
    }
}*/
