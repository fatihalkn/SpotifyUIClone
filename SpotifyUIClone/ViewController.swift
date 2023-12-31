//
//  ViewController.swift
//  SpotifyUIClone
//
//  Created by Fatih on 31.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItems()
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

