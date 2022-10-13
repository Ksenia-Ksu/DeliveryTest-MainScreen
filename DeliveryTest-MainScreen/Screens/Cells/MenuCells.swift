//
//  MenuCells.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import Foundation
import UIKit

final class MenuCell: UICollectionViewCell {
    
    let menuButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Button"
        config.baseForegroundColor = Colors.pink
        config.baseBackgroundColor = .white
        config.background.strokeColor = Colors.pink
        config.background.strokeWidth = 2.0
        config.cornerStyle = .capsule
        let menuButton = UIButton(configuration: config)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        return menuButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    private func setupCell() {
        
        self.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            
            menuButton.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0),
            menuButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            menuButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            menuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
        ])
        
    }
}

