//
//  RecentlyPlayedCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 31.12.2023.
//

import UIKit

class RecentlyPlayedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    static let identifier = "RecentlyPlayedCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setup(recently: recentlyModel) {
        textLbl.text = recently.id
        imageView.image = .init(named: recently.img)
        
    }
    

}
