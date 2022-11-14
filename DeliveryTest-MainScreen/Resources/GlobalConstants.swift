//
//  GlobalConstants.swift
//  Test-FoodDelivery-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import Foundation
import UIKit

struct MainTabBarInfo {
    
    struct SFsymbols {
        
        static let menu = "takeoutbag.and.cup.and.straw.fill"
        static let contacts = "phone.fill"
        static let profile = "person.fill"
        static let basket = "cart.fill"
    }
    
    struct Names {
        
        static let menu = "Меню"
        static let contacts = "Контакты"
        static let profile = "Профиль"
        static let basket = "Корзина"
    }
}

struct Colors {
    
    static let red = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 1)
    static let pink = UIColor(red: 0.99, green: 0.23, blue: 0.41, alpha: 0.2)
    static let nameLabel = UIColor(red: 0.133, green: 0.157, blue: 0.192, alpha: 1)
    static let ingredientsLabel = UIColor(red: 0.665, green: 0.668, blue: 0.679, alpha: 1)
    static let backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
}

struct CellIDs {
    
    static let bannerCell = "Banner Cell"
    static let menuCell = "Menu Cell"
    static let bannerTableViewCell = "Banner"
    static let tableViewCell = "Cell"
    
}

struct IDs {
    
    static let headerTableView = "Table Header"
}

struct StaticNames {
    
    static let bannerImagesArray = ["0", "1", "2", "3", "4"]
    static let buttonNamesArray = ["Пицца", "Комбо", "Десерты", "Напитки"]
    static let foodNames = ["pizza", "pasta", "desserts","beverage"]
    
}

struct Fonts {
    
    static let nameLabel =  UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
    static let ingredientsLabel = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
    static let menuButton = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
}

struct ScreenSize {
    
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}

struct City {
    
    static let cityArray = ["Москва", "Санкт-Петербург", "Казань", "Екатеринбург", "Ульяновск"]
}
