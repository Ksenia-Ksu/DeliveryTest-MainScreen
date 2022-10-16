//
//  TableViewCellBunner.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 14.10.2022.
//

import UIKit

class TableViewCellBunner: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let bannerCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ScreenSize.width - 80, height: 140)
        layout.scrollDirection = .horizontal
        let bannerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bannerCollectionView.showsHorizontalScrollIndicator = false
        bannerCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: CellIDs.bannerCell)
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return bannerCollectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: CellIDs.bannerTableViewCell)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        self.addSubview(bannerCollectionView)
        setupCell()
    }
    
    
    private func setupCell() {
        
        NSLayoutConstraint.activate([
            
            bannerCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bannerCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            bannerCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            bannerCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            
        ])
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Data.bannerImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIDs.bannerCell, for: indexPath) as! BannerCell
        cell.bannerImageView.image = UIImage(named: Data.bannerImagesArray[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 90, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
    
   
}
