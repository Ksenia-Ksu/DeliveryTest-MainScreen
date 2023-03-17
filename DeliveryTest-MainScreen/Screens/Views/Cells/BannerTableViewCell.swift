//
//  TableViewCellBunner.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 14.10.2022.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    
    let bannerCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ScreenSize.width - 80, height: 140)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let bannerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bannerCollectionView.showsHorizontalScrollIndicator = false
        bannerCollectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: CellIDs.bannerCell)
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return bannerCollectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: CellIDs.bannerTableViewCell)
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        contentView.addSubview(bannerCollectionView)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
        
    private func setupViews() {
        
        NSLayoutConstraint.activate([
            
            bannerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            bannerCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            bannerCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            bannerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
        ])
    }
}

extension BannerTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        StaticNames.bannerImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIDs.bannerCell, for: indexPath) as! BannerCollectionCell
        cell.confugureBannerCell(StaticNames.bannerImagesArray[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 90, height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
    
}
