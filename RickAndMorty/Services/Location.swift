//
//  Location.swift
//  RickAndMorty
//
//  Created by Владимир on 07.02.2022.
//

import Foundation

struct LocationrList: Codable {
    let results: [Location]
    let info: Info
}

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: URL
    let created: String
}
