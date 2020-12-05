//
//  AlbumDetailInteractor.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import Foundation

protocol AlbumDetailBusinessLogic {
    func fetchAlbumDetail(_ response: AlbumDetailModels.ShowDetail.Request)
}

protocol AlbumDetailDataStore {
    var albumID: Int { get set }
}

final class AlbumDetailInteractor: AlbumDetailBusinessLogic, AlbumDetailDataStore {

    // MARK: - Public Properties

    var presenter: AlbumDetailPresentationLogic?
    lazy var worker: AlbumDetailWorkingLogic = AlbumDetailWorker()

    // MARK: - Private Properties
    var albumID: Int = 0
    
    // MARK: - Business Logic
    func fetchAlbumDetail(_ response: AlbumDetailModels.ShowDetail.Request) {
        worker.searchAlbumsDetail(by: albumID) { (result) in
            let response = AlbumDetailModels.ShowDetail.Response(detail: result.results)
            self.presenter?.presentAlbumDetail(response)
        }
    }
}
