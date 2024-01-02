//
//  SearchCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 2.01.2024.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "GenresCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func setup (geners: searchModel) {
        
        imageView.image = .init(named: geners.img)
        
            
    }

}
