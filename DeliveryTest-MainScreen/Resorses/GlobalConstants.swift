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
}

struct CellIDs{
    
    static let bannerCell = "Banner Cell"
    static let menuCell = "Menu Cell"
    static let tableViewCell = "Cell"
    
}

struct Data {
    
    static let bannerImagesArray = ["0", "1", "2", "3", "4"]
    static let buttonNamesArray = ["Пицца", "Комбо", "Десерты", "Напитки"]
    
}

struct ScreenSize {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}
