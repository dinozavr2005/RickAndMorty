//
//  Episode.swift
//  RickAndMorty
//
//  Created by Владимир on 07.02.2022.
//

import Foundation

struct EpisodeList: Codable {
    let results: [Episode]
    let info: Info
}

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: URL
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
}
