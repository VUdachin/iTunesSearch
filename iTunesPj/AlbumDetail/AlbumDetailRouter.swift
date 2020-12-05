//
//  AlbumDetailRouter.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

protocol AlbumDetailRoutingLogic {

}

protocol AlbumDetailDataPassing {
    var dataStore: AlbumDetailDataStore? { get }
}

final class AlbumDetailRouter: AlbumDetailRoutingLogic, AlbumDetailDataPassing {

    // MARK: - Public Properties

    weak var parentController: UIViewController?
    weak var viewController: AlbumDetailViewController?
    var dataStore: AlbumDetailDataStore?
  
    // MARK: - Private Properties


    // MARK: - Routing Logic

    
    // MARK: - Navigation
  

    // MARK: - Passing data

}
