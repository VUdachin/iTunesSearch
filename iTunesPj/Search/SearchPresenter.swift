//
//  SearchPresenter.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

protocol SearchPresentationLogic {
    func presentFetchedAlbum(_ response: SearchModels.SearchAlbums.Response)
}

final class SearchPresenter: SearchPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: SearchDisplayLogic?

    // MARK: - Private Properties

    
    // MARK: - Presentation Logic
    func presentFetchedAlbum(_ response: SearchModels.SearchAlbums.Response) {
        let viewModel = SearchModels.SearchAlbums.ViewModel(albums: response.albums)
        viewController?.displayFetchedAlbum(viewModel)
    }
}
