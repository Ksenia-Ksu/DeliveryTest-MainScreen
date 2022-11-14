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
        layout.itemSize = CGSize(width: ScreenSize.width/3.3, height: 60)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.register(MenuCollectionCell.self, forCellWithReuseIdentifier: CellIDs.menuCell)
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
        
    }
    
    func selectedCategory(_ button: UIButton, isTapped: Bool) {
        
        if isTapped {
            button.configuration?.baseBackgroundColor = Colors.pink
            button.configuration?.baseForegroundColor = Colors.red
        } else {
            button.configuration?.baseBackgroundColor = .white
            button.configuration?.baseForegroundColor = Colors.pink
        }
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


