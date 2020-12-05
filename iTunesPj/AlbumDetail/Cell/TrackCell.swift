//
//  TrackCell.swift
//  iTunesPj
//
//  Created by Vladimir Udachin on 04.12.2020.
//

import UIKit

class TrackCell: UITableViewCell {

    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var trackTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: AlbumDetail) {
        trackNameLabel.text = model.trackName
        trackTimeLabel.text = "\(model.trackTimeMillis! * 1000 * 60)"
    }
    

}
