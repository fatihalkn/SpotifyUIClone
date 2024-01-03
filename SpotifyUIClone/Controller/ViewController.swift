//
//  ViewController.swift
//  SpotifyUIClone
//
//  Created by Fatih on 31.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recentlyCollectionView: UICollectionView!
    
    @IBOutlet weak var yourCollecitonView: UICollectionView!
    
    @IBOutlet weak var editorCollectionView: UICollectionView!
    
    @IBOutlet weak var reviewİmg: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var recently: [recentlyModel] = [.init(id: "", img: "recently-1"), .init(id: "", img: "recently-2"), .init(id: "", img: "recently-3"), .init(id: "", img: "recently-4")]
    
    var revealed: [revealedModel] = [.init(id: "Your Top Songs 2023", img: "reveal-1"), .init(id: "Your Artists", img: "reveal-2")]
    
    var editor: [EditorModel] = [.init(id: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone", img: "editor-1"), .init(id: "Mitski, Tame Impala, Glass Animals, Charli XCX", img: "editor-2"), .init(id: "Mitski, Tame Impala, Glass Animals, Charli XCX", img: "editor-3")]
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationItems()
        
        reviwCell()
        
        registerCells()
        
        recentlyCollectionView.delegate = self
        recentlyCollectionView.dataSource = self
        
        yourCollecitonView.delegate = self
        yourCollecitonView.dataSource = self
        
        editorCollectionView.delegate = self
        editorCollectionView.dataSource = self
        
    
        
        
    }
    
    func reviwCell() {
        textLbl.text = "#SPOTIFYWRAPPED"
        titleLbl.text = "Your 2023 in review"
        reviewİmg.image = .songs
    }
    
    func registerCells() {
        recentlyCollectionView.register(UINib(nibName: RecentlyPlayedCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RecentlyPlayedCollectionViewCell.identifier)
        
        yourCollecitonView.register(UINib(nibName: RevealedCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RevealedCollectionViewCell.identifier)
        
        editorCollectionView.register(UINib(nibName: EditorCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: EditorCollectionViewCell.identifier)
        }
    
    func configureNavigationItems() {
        let label = UILabel()
        label.text = "Recently Played"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        let leftBarButtonItem = UIBarButtonItem(customView: label)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            
        case recentlyCollectionView:
            return recently.count
        case yourCollecitonView:
            return revealed.count
        case editorCollectionView:
            return editor.count
        default: return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        case recentlyCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPlayedCollectionViewCell.identifier, for: indexPath) as! RecentlyPlayedCollectionViewCell
            cell.setup(recently: recently[indexPath.row])
            return cell
            
        case yourCollecitonView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RevealedCollectionViewCell.identifier, for: indexPath) as! RevealedCollectionViewCell
            cell.setup(revealed: revealed[indexPath.row])
            return cell
            
        case editorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EditorCollectionViewCell.identifier, for: indexPath) as! EditorCollectionViewCell
            cell.setup(editor: editor[indexPath.row])
            return cell
       
            
        default: return UICollectionViewCell()
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
            
        case recentlyCollectionView:
            let cellWidth: CGFloat = collectionView.frame.height - 30
            let cellHeight: CGFloat = collectionView.frame.height
            return .init(width: cellWidth, height: cellHeight)
        case yourCollecitonView:
            let cellWidth: CGFloat = collectionView.frame.height - 30
            let cellHeight: CGFloat = collectionView.frame.height
            return .init(width: cellWidth, height: cellHeight)
        case editorCollectionView:
            let cellWidth: CGFloat = collectionView.frame.height - 30
            let cellHeight: CGFloat = collectionView.frame.height
            return .init(width: cellWidth, height: cellHeight)
            
            
        default: return CGSize()
            
        }
        
    }
}

