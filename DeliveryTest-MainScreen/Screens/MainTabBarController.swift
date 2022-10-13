//
//  MainTabBarController.swift
//  Test-FoodDelivery-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import UIKit


final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSettings()
      
    }
    
    
    func tabBarSettings() {
        
        self.tabBar.tintColor = Colors.red
        
        let menuScreen = MainViewController()
        let menuTabItem = UITabBarItem(title: MainTabBarInfo.Names.menu, image: UIImage(systemName: MainTabBarInfo.SFsymbols.menu), tag: 0)
        menuScreen.tabBarItem = menuTabItem
        let navFirst = UINavigationController(rootViewController: menuScreen)
        
        let contactsScreen = ViewController()
        let contactsItem = UITabBarItem(title: MainTabBarInfo.Names.contacts, image: UIImage(systemName: MainTabBarInfo.SFsymbols.contacts), tag: 1)
        contactsScreen.tabBarItem = contactsItem
        
        
        let profileScreen = ViewController()
        let profileItem = UITabBarItem(title: MainTabBarInfo.Names.profile, image: UIImage(systemName: MainTabBarInfo.SFsymbols.profile), tag: 1)
        profileScreen.tabBarItem = profileItem
        
        
        let basketScreen = ViewController()
        let basketItem = UITabBarItem(title: MainTabBarInfo.Names.basket, image: UIImage(systemName: MainTabBarInfo.SFsymbols.basket), tag: 1)
        basketScreen.tabBarItem = basketItem
        
        
        self.viewControllers = [navFirst, contactsScreen, profileScreen, basketScreen]
        
    }
    
}



