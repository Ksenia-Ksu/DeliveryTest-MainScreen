//
//  TableViewCell.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: CellIDs.tableViewCell)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    lazy var imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        return imageView
    }()
    
   private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.textColor = Colors.nameLabel
        nameLabel.numberOfLines = 0
        nameLabel.font = Fonts.nameLabel
        nameLabel.text = "Pizza Margarita"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var ingredientsLabel: UILabel = {
        let ingredientsLabel = UILabel()
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.numberOfLines = 0
        ingredientsLabel.textColor = Colors.ingredientsLabel
        ingredientsLabel.font = Fonts.ingredientsLabel
        ingredientsLabel.text = "pizza margarita"
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        return ingredientsLabel
    }()
    
    lazy var orderButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "от 345"
        config.baseForegroundColor = Colors.red
        config.baseBackgroundColor = .white
        config.background.strokeColor = Colors.red
        config.background.strokeWidth = 2.0
        config.cornerStyle = .fixed
        let orderButton = UIButton(configuration: config)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        return orderButton
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureMenuCell(title: String) {
        nameLabel.text = title
        ingredientsLabel.text = title
    }
    
    private func setupCell() {
        
        self.addSubview(imageViewCell)
        self.addSubview(nameLabel)
        self.addSubview(ingredientsLabel)
        self.addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            
            imageViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            imageViewCell.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            imageViewCell.widthAnchor.constraint(equalToConstant: 120),
            imageViewCell.heightAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            
            ingredientsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            ingredientsLabel.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 20),
            ingredientsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            ingredientsLabel.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -10),
            
            orderButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            orderButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            orderButton.heightAnchor.constraint(equalToConstant: 40),
            orderButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    
}
