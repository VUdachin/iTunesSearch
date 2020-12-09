//
//  SearchWorker.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import Foundation

protocol SearchWorkingLogic {
    func searchAlbums(by name: String, completion: @escaping (AlbumResponse) -> Void)
}

final class SearchWorker: SearchWorkingLogic {
  
    // MARK: - Private Properties
    private let networkWorker = NetworkWorker()

    
    // MARK: - Working Logic
    func searchAlbums(by name: String, completion: @escaping (AlbumResponse) -> Void) {
        let searchString = name.replacingOccurrences(of: " ", with: "+")
        let params = ["media": "music", "entity": "album", "limit": "25", "term": "\(searchString)"]
        guard let url = URL(string: searchURL) else { return }
        
        networkWorker.sendRequest(of: AlbumResponse.self, from: url, params: params) { (response) in
            switch response {
            case .failure(let error):
                print(error)
            case .success(let album):
                completion(album)
            }
        }
    }
}
