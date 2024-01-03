//
//  PodcastCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 3.01.2024.
//

import UIKit

class PodcastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    static let identifier = "PodcastCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func setup(podcast: podcastModel ) {
        textLbl.text = podcast.id
        imageView.image = .init(named: podcast.img)
    }

}
