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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
     
    }
    
    private func setupCell() {
        
    }
}
