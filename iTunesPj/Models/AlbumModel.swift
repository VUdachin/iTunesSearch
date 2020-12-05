//
//  AlbumModel.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import Foundation

// MARK: - Album
struct AlbumResponse: Codable {
    let resultCount: Int?
    let results: [Album]
}

// MARK: - Result
struct Album: Codable {
    let wrapperType: String?
    let collectionType: String?
    let artistID, collectionID, amgArtistID: Int?
    let artistName: String?
    let collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice: Double?
    let collectionExplicitness: String?
    let contentAdvisoryRating: String?
    let trackCount: Int?
    let copyright: String?
    let country: String?
    let currency: String?
    let primaryGenreName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, contentAdvisoryRating, trackCount, copyright, country, currency, primaryGenreName
    }
}



