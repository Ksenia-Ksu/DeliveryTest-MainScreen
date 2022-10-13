//
//  MainView.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import Foundation
import UIKit

final class MainView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()
    
    let bannerCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: ScreenSize.width - 80, height: 140)
        layout.scrollDirection = .horizontal
        let bannerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        bannerCollectionView.showsHorizontalScrollIndicator = false
        bannerCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: CellIDs.bannerCell)
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return bannerCollectionView
        
    }()
    
    let menuCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: ScreenSize.width/4, height: 50)
        layout.scrollDirection = .horizontal
        let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: CellIDs.menuCell)
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return menuCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        self.addSubview(bannerCollectionView)
        self.addSubview(menuCollectionView)
        self.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            bannerCollectionView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0),
            bannerCollectionView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 0),
            bannerCollectionView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: 0),
            bannerCollectionView.heightAnchor.constraint(equalToConstant: 140),
            
            menuCollectionView.topAnchor.constraint(equalTo: bannerCollectionView.bottomAnchor, constant: 20),
            menuCollectionView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 0),
            menuCollectionView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: 0),
            menuCollectionView.heightAnchor.constraint(equalToConstant: 50),
          
            
        ])
        
        
    }
    
    
    
}
