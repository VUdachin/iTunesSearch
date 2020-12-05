//
//  SearchInteractor.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import Foundation

protocol SearchBusinessLogic {
    func fetchAlbum(_ request: SearchModels.SearchAlbums.Request)
    func selectAlbum(_ request: SearchModels.SelectAlbum.Request)
}

protocol SearchDataStore {
    var selectedAlbum: Int { get }
}

final class SearchInteractor: SearchBusinessLogic, SearchDataStore {

    // MARK: - Public Properties

    var presenter: SearchPresentationLogic?
    lazy var worker: SearchWorkingLogic = SearchWorker()

    // MARK: - Private Properties
    var selectedAlbum: Int = 0

    // MARK: - Business Logic
    func fetchAlbum(_ request: SearchModels.SearchAlbums.Request) {
        worker.searchAlbums(by: request.albumName) { (response) in
            let response = SearchModels.SearchAlbums.Response(albums: response.results)
            self.presenter?.presentFetchedAlbum(response)
        }
    }
    
    func selectAlbum(_ requst: SearchModels.SelectAlbum.Request) {
        selectedAlbum = requst.index
    }
    
}
