//
//  SearchCell.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

class SearchCell: UICollectionViewCell {

    @IBOutlet private weak var albumImage: UIImageView!
    
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var albumName: UILabel!

    func configure(with model: Album) {
        artistName.text = model.artistName
        albumName.text = model.collectionName
        albumImage.downloadFrom(imageUrl: model.artworkUrl100 ?? "")
    }

}
