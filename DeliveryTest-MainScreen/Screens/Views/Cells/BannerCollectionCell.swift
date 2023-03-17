//
//  BannerCellCollectionView.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import Foundation
import UIKit

final class BannerCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
    }
    
    lazy var bannerImageView: UIImageView = {
        let bannerImageView = UIImageView()
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.clipsToBounds = true
        bannerImageView.image = UIImage(named: "1")
        bannerImageView.contentMode = .scaleToFill
        bannerImageView.layer.cornerRadius = 10
        return bannerImageView
    }()
    
    
    private func setupViews() {
        
        contentView.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            
            bannerImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0),
            bannerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            bannerImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            
        ])
    }
    
    func confugureBannerCell(_ image: String) {
        bannerImageView.image = UIImage(named: image)
    }
    
}

