//
//  Film.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//

import Foundation

enum FilmType: String {
    case feed = "advertisement"
    case market = "questions"
    case user
}

struct Film {
    var id: String?
    var name: String?
    var category: String?
    var userId: String?
    var imageURLs: [String] = []
    var type: FilmType?
    var rating: String?
}
