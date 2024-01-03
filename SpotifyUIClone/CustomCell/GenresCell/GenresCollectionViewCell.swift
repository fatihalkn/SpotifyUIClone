//
//  SearchCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 2.01.2024.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    static let identifier = "GenresCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func setup (geners: searchModel) {
        textLbl.text = geners.id
        imageView.image = .init(named: geners.img)
        
            
    }

}
