//
//  SearchCell.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet private weak var albumImage: UIImageView!
    
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var albumName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: Album) {
        artistName.text = model.artistName
        albumName.text = model.collectionName
        albumImage.downloadFrom(imageUrl: model.artworkUrl100 ?? "")
    }

}
