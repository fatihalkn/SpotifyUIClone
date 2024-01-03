//
//  PopularCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 3.01.2024.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "PopularCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func setup(popular: popularModel) {
        imageView.image = .init(named: popular.img)
    }
    
    

}
