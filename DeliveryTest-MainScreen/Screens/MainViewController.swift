//
//  ViewController.swift
//  Test-FoodDelivery-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    
    var networkService = NetworkDataService()
    
    let headerMenu = TableViewHeaderMenu(reuseIdentifier: IDs.headerTableView)
    
    var arrayButtons = [UIButton]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: CellIDs.tableViewCell)
        tableView.register(TableViewCellBunner.self, forCellReuseIdentifier: CellIDs.bannerTableViewCell)
        tableView.rowHeight = 150
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        tableView.delegate = self
        tableView.dataSource = self
        headerMenu.menuCollectionView.dataSource = self
        headerMenu.menuCollectionView.delegate = self
        setupTableView()
        setupNavigationBar()
        
    }
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
        ])
        
        
    }
    
    private func setupNavigationBar() {
                
        let cityButton = UIBarButtonItem(title: (City.cityArray[0] + (" ↓")), style: .plain, target: self,  action: nil)
        
        var menuChildrens = [UIMenuElement]()
        
        for city in City.cityArray {
            
            let item = UIAction(title: city, image: UIImage()) { _ in
                print(city)
            }
            
            menuChildrens.append(item)
        }
        
        let cityMenu = UIMenu(title: NSLocalizedString("Выберите город", comment: ""), identifier: UIMenu.Identifier("cityMenu"), options: .singleSelection, children: menuChildrens)
        
        cityButton.menu = cityMenu
        
        navigationItem.leftBarButtonItems = [cityButton]
    }
    
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Data.buttonNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIDs.menuCell, for: indexPath) as! MenuCell
        cell.menuButton.configuration?.title = Data.buttonNamesArray[indexPath.row]
        cell.menuButton.tag = indexPath.row
        arrayButtons.append(cell.menuButton)
        if arrayButtons.count >= 1 {
            buttonsColor(buttonsArray: arrayButtons, tag: 0)
        }
        cell.menuButton.addTarget(self, action: #selector(butonTapped), for: .touchUpInside)
        return cell
    }
    
    
    
    @objc func butonTapped(sender: UIButton) {
        
        buttonsColor(buttonsArray: arrayButtons, tag: sender.tag)
        
        let name = Data.foodNames[sender.tag]
        networkService.getItems(foodName: name) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let items):
                    self.presenter.items = items
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func buttonsColor(buttonsArray: [UIButton], tag: Int){
        
        for (index,button) in buttonsArray.enumerated() {
            if index == tag {
                button.configuration?.baseBackgroundColor = Colors.pink
                button.configuration?.baseForegroundColor = Colors.red
            } else {
                button.configuration?.baseBackgroundColor = .white
                button.configuration?.baseForegroundColor = Colors.pink
                
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else  {
            return presenter.items?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.bannerTableViewCell, for: indexPath) as! TableViewCellBunner
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.tableViewCell, for: indexPath) as! TableViewCell
            if let item = presenter.items?[indexPath.row] {
                cell.configCell(title: item.title ?? "No info")
                cell.imageViewCell.imageFromUrl(urlString: item.image ?? "")
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            return headerMenu
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 70
        }
    }
    
    
    
}

extension MainViewController: MainViewProrocol {
    
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

extension UIImageView {
    
    func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    self.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
