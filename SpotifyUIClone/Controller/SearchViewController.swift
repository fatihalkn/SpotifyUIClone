//
//  SearchViewController.swift
//  SpotifyUIClone
//
//  Created by Fatih on 2.01.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var genresCollectionViewCell: UICollectionView!
    @IBOutlet weak var browseCollectionViewCell: UICollectionView!
    @IBOutlet weak var podcastCollectionViewCell: UICollectionView!
    
    var geners: [searchModel] = [.init(img: "1"), .init(img: "2"), .init(img: "3"), .init(img: "4")]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - SearchBar Created
        
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "search")
        
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        
        imageIcon.frame = CGRect(x: 5, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        
        searchBar.leftView = contentView
        searchBar.leftViewMode = .always
        searchBar.clearButtonMode = .whileEditing
        
        registerCell()
        
        configureNavigationItems()
        
        
        genresCollectionViewCell.dataSource = self
        genresCollectionViewCell.delegate = self
        
        
    }
    
    func registerCell() {
        genresCollectionViewCell.register(UINib(nibName: GenresCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GenresCollectionViewCell.identifier)
    }
    
    
    
    func configureNavigationItems() {
        let label = UILabel()
        label.text = "Search"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        let leftBarButtonItem = UIBarButtonItem(customView: label)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case genresCollectionViewCell:
            return geners.count
        default: return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case genresCollectionViewCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCollectionViewCell.identifier, for: indexPath) as! GenresCollectionViewCell
            cell.setup(geners: geners[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch collectionView {
            case genresCollectionViewCell:
                return CGSize(width: 192, height: 109)
            default:
                return CGSize()
            }
        }
    
}

