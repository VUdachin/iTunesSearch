//
//  AlbumDetailModels.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

enum AlbumDetailModels {
  
    // MARK: - Something
    enum ShowDetail {
        struct Request {}
        
        struct Response {
            let detail: [AlbumDetail]
        }
    
        struct ViewModel {
            let detail: [AlbumDetail]
        }
    }
}
