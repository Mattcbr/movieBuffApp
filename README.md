# Movie Buff
[This app is still in development]

Know what's new in the big screen. Learn more about the movies. Always have your favorite movies with you. 
![](https://mattcbr.github.io/imgs/Projects/Apps/movieBuff.png)

## App Description

This app was developed as a portfolio app, and also in order to learn new iOS Development skills. It consists of a movies app that will show you lists of featured, top rated, favorite movies and will give you some other options. All the Movies and Information are provided by [The Movie Database API](https://developers.themoviedb.org/3/getting-started/introduction). Here is a description of each screen in this app:

* "Featured" Screen:

This screen shows a list of the featured movies of the day. It shows details as the movie's thumbnail and the name. Also, it has infinite scroll, for a better experience and also has a local search, if the user wants to search through the movies.

* "Top Rated" Screen:

This screen works exactly as the "featured" screen, but shows a list of the top rated movies instead of the featured ones.

* "Search" Screen:

In this screen the user can search for a movie, by typing the name and hitting "search". If the app finds a movie related to what was searched, it shows the list of movies that was found. If not, it shows an error message. It also has an error message to handle the case where the user tried to search for blank.

* "Favorites" Screen:

This screen shows a list of movies that were marked as favorite. Favorite movies are persisted locally in a database and retrieved at the first time the "favorites" screen is shown. This screen shows more details about the movies (like description, genre) than the "featured" and "top rated" screens and also has a local search bar.

* "More" Screen:

This screen is not developed yet. It will have account and app configurations.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

To run this app you will need:
* [Xcode](https://developer.apple.com/xcode/)

You can download the source code manually using GitHub's interface or using the terminal:

```
git clone https://github.com/Mattcbr/movieBuffApp.git
```

## Running the tests

Tests were not developed yet for this app.

## Built With

* [Swift](https://developer.apple.com/swift/) - The programming language used
* [Cocoapods](https://cocoapods.org/) - Dependency Management
* [AlamoFire](https://github.com/Alamofire/Alamofire) - Used to make API requests

## Authors

* **Matheus Castelo**
  - [Website](https://mattcbr.github.io/)
  - [Github](https://github.com/Mattcbr)
  - [LinkedIn](https://www.linkedin.com/in/matheuscastelo/)
  
## Acknowledgments

* [The Movie Database](https://www.themoviedb.org/)
