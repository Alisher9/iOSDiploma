//
//  MovieContainer.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//

import Foundation

protocol MovieContainer {
    var movie: Film? { get set }
}

final class MovieContainerImpl: MovieContainer {
    var movie: Film?
}
