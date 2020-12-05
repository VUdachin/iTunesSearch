//
//  SearchRouter.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

protocol SearchRoutingLogic {
    func routeToAlbumDetails()
}

protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

final class SearchRouter: SearchRoutingLogic, SearchDataPassing {

    // MARK: - Public Properties
    weak var viewController: SearchViewController?
    var dataStore: SearchDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic
    func routeToAlbumDetails() {
        guard
            let viewController = viewController,
            let storyboard = viewController.storyboard,
            let AlbumDetailVC = storyboard.instantiateViewController(withIdentifier: "AlbumDetailViewController") as? AlbumDetailViewController,
            var AlbumDetailDS = AlbumDetailVC.router?.dataStore else {
            fatalError("Fail route to BreedInfo")
            }
            passDataToBreedInfo(destination: &AlbumDetailDS)
            navigateToBreedInfo(destination: AlbumDetailVC)
      }

    // MARK: - Navigation
    private func navigateToBreedInfo(destination: AlbumDetailViewController) {
        viewController?.navigationController?.pushViewController(destination, animated: true)
      }

    // MARK: - Passing data
    private func passDataToBreedInfo(destination: inout AlbumDetailDataStore) {
        destination.albumID = dataStore!.selectedAlbum
    }
}
