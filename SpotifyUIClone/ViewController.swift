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
    
    var recently: [recentlyModel] = [.init(id: "11", img: "a"),.init(id: "11", img: "a"),.init(id: "11", img: "a"),.init(id: "11", img: "11"),.init(id: "11", img: "11"),.init(id: "11", img: "11"),.init(id: "11", img: "11"),.init(id: "11", img: "11"),.init(id: "11", img: "11"),.init(id: "11", img: "11"),.init(id: "11", img: "11")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationItems()
        
        registerCells()
        
        recentlyCollectionView.delegate = self
        recentlyCollectionView.dataSource = self
    }
    
    
    func registerCells() {
        recentlyCollectionView.register(UINib(nibName: RecentlyPlayedCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RecentlyPlayedCollectionViewCell.identifier)
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
        return recently.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPlayedCollectionViewCell.identifier, for: indexPath) as! RecentlyPlayedCollectionViewCell
        cell.setup(recently: recently[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = collectionView.frame.height - 30
        let cellHeight: CGFloat = collectionView.frame.height
        
        return .init(width: cellWidth, height: cellHeight)
    }
}

