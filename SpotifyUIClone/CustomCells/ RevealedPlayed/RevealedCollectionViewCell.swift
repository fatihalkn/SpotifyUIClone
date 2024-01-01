//
//  RevealedCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 1.01.2024.
//

import UIKit

class RevealedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    static let identifier = "RevealedCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(revealed: revealedModel) {
        imageView.image = .init(named: revealed.img)
        textLbl.text = revealed.id
    }
    
    

}
