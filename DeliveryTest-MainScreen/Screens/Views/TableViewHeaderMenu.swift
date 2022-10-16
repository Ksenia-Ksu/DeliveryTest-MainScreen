//
//  TestTableViewHeader.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 14.10.2022.
//

import UIKit



final class TableViewHeaderMenu:  UITableViewHeaderFooterView {
    
    let menuCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: ScreenSize.width/4, height: 60)
        layout.scrollDirection = .horizontal
        let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: CellIDs.menuCell)
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return menuCollectionView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundConfiguration?.backgroundColor = .white
        addSubview(menuCollectionView)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //  setupView()
    }
    
    private func setupView()  {
        self.addSubview(menuCollectionView)
        
        NSLayoutConstraint.activate([
            
            menuCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            menuCollectionView.leftAnchor.constraint(equalTo:  self.leftAnchor, constant: 0),
            menuCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            menuCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
         
            
        ])
    }
    
    
    
}


