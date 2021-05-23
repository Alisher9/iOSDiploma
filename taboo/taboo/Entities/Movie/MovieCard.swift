//
//  MovieCard.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/23/21.
//

import Foundation

struct MovieCard: Codable {
    var id: Int?
    var title: String?
    var rating: String?
    var image: String?
    var description: String?
    var year: String?
    var country: String?
    var category: String?
    var genres: [String?]
    var directors: [String?]
    var actors: [String?]
    var duration: String?
}
