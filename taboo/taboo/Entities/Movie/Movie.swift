//
//  Movie.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/16/21.
//

import Foundation

struct MovieCategory: Codable {
    var title: String?
    var movies: [Movie]?
    var id: Int?
    
    static func featuredMovies(completionHandler: @escaping([MovieCategory]) -> ()) {
            
            guard let url = URL(string: "https://c7286ae03971.ngrok.io/api/home/") else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    return
                }
                do {
                    guard let data = data else {
                        return
                    }
                    
                    let json = try JSONDecoder().decode([MovieCategory].self, from: data)
                    
                    DispatchQueue.main.async {
                        completionHandler(json)
                    }
                } catch let err {
                    print(err)
                }
                
            }) .resume()
        }
}

struct Movie: Codable {
    var id: Int?
    var title: String?
    var category: String?
    var image: String?
    var genres: [String]?
}
