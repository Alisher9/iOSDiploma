//
//  Movie.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/16/21.
//

import UIKit

class MovieCategory: NSObject {
    var name: String?
    var movies: [Movie]?
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "movies" {
            
            movies = [Movie]()
            
            for dict in value as! [[String: Any]] {
                let movie = Movie()
                movie.setValuesForKeys(dict)
                movies?.append(movie)
            }
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func featuredMovies(completionHandler: @escaping([MovieCategory]) -> ()) {
        let urlString = URL(string: "")!
        
        URLSession.shared.dataTask(with: urlString) { (data, response, error) -> Void in
            if error != nil {
                return
            }
            do {
                let json = try JSONSerialization.data(withJSONObject: data!, options: .prettyPrinted)
                
                var movieCategories = [MovieCategory]()
                
//                for dict in json["categories"] as! [[String: Any]] {
//                    let movieCategory = MovieCategory()
//                    movieCategory.setValuesForKeys(dict)
//                    movieCategories.append(movieCategory)
//                }
                
                print("/// movieCategories", movieCategories)
                DispatchQueue.main.async {
                    completionHandler(movieCategories)
                }
                
            } catch let err {
                print(err)
            }
            
        }.resume()
    }
    
    static func sampleMovieCategory() -> [MovieCategory] {
        let recommendationCategory = MovieCategory()
        recommendationCategory.name = "Recommendations"
        
        var movie = [Movie]()
        
        let sherlockMovie = Movie()
        sherlockMovie.name = "Sherlock Holmes"
        sherlockMovie.imageName = "sherlock"
        sherlockMovie.category = "Mystery/Action"
        movie.append(sherlockMovie)
        
        recommendationCategory.movies = movie
        return [recommendationCategory]
    }
}

class Movie: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
}
