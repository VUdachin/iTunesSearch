//
//  AlbumCell.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 06.12.2020.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: AlbumDetail) {
        albumImageView.downloadFrom(imageUrl: model.artworkUrl100!)
        artistLabel.text = model.artistName
        albumLabel.text = model.collectionName
        genreLabel.text = model.primaryGenreName
        trackCountLabel.text = "Количество треков: \(model.trackCount)"
    }

}
