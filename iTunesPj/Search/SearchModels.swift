//
//  SearchModels.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

enum SearchModels {
  
    // MARK: - Something
    enum SearchAlbums {
        struct Request {
            let albumName: String
        }
    
        struct Response {
            let albums: [Album]
        }
    
        struct ViewModel {
            let albums: [Album]
        }
    }
    
    enum SelectAlbum {
        struct Request {
            let index: Int
        }
    }
}


