//
//  MenuCells.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//


import UIKit

final class MenuCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    
    lazy var menuButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = Fonts.menuButton
            return outgoing
        }
        config.baseForegroundColor = Colors.red
        config.baseBackgroundColor = .white
        config.background.strokeColor = Colors.pink
        config.background.strokeWidth = 1.0
        config.cornerStyle = .capsule
        let menuButton = UIButton(configuration: config)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        return menuButton
    }()
    
    
    private func setupViews() {
        
        contentView.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            
            menuButton.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0),
            menuButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            menuButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            menuButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            
        ])
        
    }
}

