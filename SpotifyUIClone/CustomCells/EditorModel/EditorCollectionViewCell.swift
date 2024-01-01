//
//  EditorCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Fatih on 1.01.2024.
//

import UIKit

class EditorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    static let identifier = "EditorCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(editor: EditorModel) {
        textLbl.text = editor.id
        imageView.image = .init(named: editor.img)
        
    }

}
