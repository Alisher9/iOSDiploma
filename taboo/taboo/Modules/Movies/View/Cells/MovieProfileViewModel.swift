//
//  MovieProfileViewModel.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/23/21.
//

import Foundation

struct MovieProfileViewModel: Codable {
    var id: Int?
    var image: String?
    var name: String?
    var phone: String?
    var favourites: [Favourites]
}

struct Favourites: Codable {
    var id: Int?
    var title: String?
    var image: String?
    var genres: [String?]
    var category: String?
    var rating: String?
}

