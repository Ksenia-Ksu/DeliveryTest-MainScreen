//
//  MainScreenAssembly.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 15.10.2022.
//

import UIKit

protocol Builder {
    static func createModule() -> UIViewController
}

class MainScreenAssembly: Builder {
    static func createModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkDataService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
        
    }
}
    
    
    
    
