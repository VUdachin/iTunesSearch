//
//  AlbumDetailPresenter.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

protocol AlbumDetailPresentationLogic {
    func presentAlbumDetail(_ response: AlbumDetailModels.ShowDetail.Response)
}

final class AlbumDetailPresenter: AlbumDetailPresentationLogic {

    // MARK: - Public Properties

    weak var viewController: AlbumDetailDisplayLogic?

    // MARK: - Private Properties

    
    // MARK: - Presentation Logic
    func presentAlbumDetail(_ response: AlbumDetailModels.ShowDetail.Response) {
        let viewModel = AlbumDetailModels.ShowDetail.ViewModel(detail: response.detail)
        viewController?.displayAlbumDetail(viewModel)
    }
}
