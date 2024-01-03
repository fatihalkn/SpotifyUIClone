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
    
    var geners: [searchModel] = [.init(id: "News & Politics", img: "1"), .init(id: "Comedy", img: "2")]
    
    var podcast: [podcastModel] = [.init(id: "2021 Wrapped", img: "1-1"), .init(id: "Podcasts", img: "1-2"), .init(id: "Made for you", img: "1-3"), .init(id: "Charts", img: "1-4")]
    
    var popular: [popularModel] = [.init(img: "1-5"), .init(img: "1-6")]
    
    
    
    
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
        
        browseCollectionViewCell.dataSource = self
        browseCollectionViewCell.delegate = self
        
        
        podcastCollectionViewCell.dataSource = self
        podcastCollectionViewCell.delegate = self
    }
    
    func registerCell() {
        genresCollectionViewCell.register(UINib(nibName: GenresCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GenresCollectionViewCell.identifier)
        browseCollectionViewCell.register(UINib(nibName: PodcastCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PodcastCollectionViewCell.identifier)
        podcastCollectionViewCell.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
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
        case browseCollectionViewCell:
            return podcast.count
        case podcastCollectionViewCell:
            return popular.count
        default: return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case genresCollectionViewCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCollectionViewCell.identifier, for: indexPath) as! GenresCollectionViewCell
            cell.setup(geners: geners[indexPath.row])
            return cell
            
        case browseCollectionViewCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PodcastCollectionViewCell.identifier, for: indexPath) as! PodcastCollectionViewCell
            cell.setup(podcast: podcast[indexPath.row])
            return cell
            
        case podcastCollectionViewCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(popular: popular[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch collectionView {
                
            case genresCollectionViewCell:
                return CGSize(width: 192, height: 109)
            case browseCollectionViewCell:
                return CGSize(width: 192, height: 109)
            case podcastCollectionViewCell:
                return CGSize(width: 192, height: 109)
                
                
            default: return CGSize()
                
            }
        }
    
}

