//
//  AlbumDetail.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import Foundation

// MARK: - AlbumDetail
struct AlbumDetailResponse: Codable {
    let resultCount: Int
    let results: [AlbumDetail]
}

// MARK: - Result
struct AlbumDetail: Codable {
    let wrapperType: WrapperType
    let collectionType: String?
    let artistID, collectionID: Int
    let amgArtistID: Int?
    let artistName: String
    let collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String?
    let trackCount: Int
    let copyright: String?
    let country: String?
    let currency: String?
    let releaseDate: Date
    let primaryGenreName: String?
    let kind: String?
    let trackID: Int?
    let trackName, trackCensoredName: String?
    let trackViewURL: String?
    let previewURL: String?
    let artworkUrl30: String?
    let trackPrice: Double?
    let trackExplicitness: String?
    let discCount, discNumber, trackNumber, trackTimeMillis: Int?
    let isStreamable: Bool?

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName, kind
        case trackID = "trackId"
        case trackName, trackCensoredName
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, trackPrice, trackExplicitness, discCount, discNumber, trackNumber, trackTimeMillis, isStreamable
    }
}

enum WrapperType: String, Codable {
    case collection = "collection"
    case track = "track"
}
