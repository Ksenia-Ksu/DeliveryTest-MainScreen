//
//  MainPresenter.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 15.10.2022.
//

import Foundation

protocol MainViewProrocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    
    init (view: MainViewProrocol, networkService: NetworkServiceProtocol)
    func getItems()
    var items: [Item]? { get set }
    
}

class MainPresenter: MainViewPresenterProtocol {
    
    var items: [Item]?
    let view: MainViewProrocol
    let networkService: NetworkServiceProtocol
    
    required init(view: MainViewProrocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getItems()
    }
    
    func getItems() {
        networkService.getItems(foodName: "pizza") { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let items):
                    self.items = items
                    self.view.success()
                case .failure(let error):
                    self.view.failure(error: error)
                }
            }
        }
    }
    
    
}
