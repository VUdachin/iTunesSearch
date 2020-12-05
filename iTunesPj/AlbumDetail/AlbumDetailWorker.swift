//
//  AlbumDetailWorker.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import Foundation

protocol AlbumDetailWorkingLogic {
    func searchAlbumsDetail(by id: Int, completion: @escaping (AlbumDetailResponse) -> Void)
}

final class AlbumDetailWorker: AlbumDetailWorkingLogic {
  
    // MARK: - Private Properties
    private let networkWorker = NetworkWorker()

    // MARK: - Working Logic
    func searchAlbumsDetail(by id: Int, completion: @escaping (AlbumDetailResponse) -> Void) {
        let params = ["entity": "song", "id": "\(id)"]
        guard let url = URL(string: lookupURL) else { return }
        
        networkWorker.sendRequest(of: AlbumDetailResponse.self, from: url, params: params) { (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let album):
                completion(album)
            }
        }
    }
}
