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
        
        self.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            
            bannerImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0),
            bannerImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            bannerImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
        ])
    }
    
    func confugureBannerCell(_ image: String) {
        bannerImageView.image = UIImage(named: image)
    }
    
}

