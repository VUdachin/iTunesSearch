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
        trackNameLabel.text = "\(model.trackNumber ?? 0). \(model.trackName ?? "")"
        trackTimeLabel.text = timeFromMillis(duration: model.trackTimeMillis ?? 0)
    }
    
    func timeFromMillis(duration: Int) -> String {
        let interval = TimeInterval(duration / 1000)
        print(interval)
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 2
        
        return formatter.string(from: interval)!
    }
    
}
