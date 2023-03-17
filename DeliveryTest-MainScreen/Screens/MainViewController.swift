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
    
    private enum SectionType: Int, CaseIterable {
        case banners
        case menu
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: CellIDs.tableViewCell)
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: CellIDs.bannerTableViewCell)
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
        
        var menuCities = [UIMenuElement]()
        
        for city in City.cityArray {
            
            let item = UIAction(title: city, image: UIImage()) { _ in
                print(city)
            }
            
            menuCities.append(item)
        }
        
        let cityMenu = UIMenu(title: NSLocalizedString("Выберите город", comment: ""), identifier: UIMenu.Identifier("cityMenu"), options: .singleSelection, children: menuCities)
        
        cityButton.menu = cityMenu
        
        navigationItem.leftBarButtonItems = [cityButton]
    }
    
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        StaticNames.buttonNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIDs.menuCell, for: indexPath) as! MenuCollectionCell
        cell.menuButton.configuration?.title = StaticNames.buttonNamesArray[indexPath.row]
        cell.menuButton.tag = indexPath.row
        arrayButtons.append(cell.menuButton)
        if arrayButtons.count >= 1 {
            categoryButtonsChangeColor(buttonsArray: arrayButtons, tag: 0)
        }
        cell.menuButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        return cell
    }
    
    
    
    @objc func categoryButtonTapped(sender: UIButton) {
        
        categoryButtonsChangeColor(buttonsArray: arrayButtons, tag: sender.tag)
        
        let name = StaticNames.foodNames[sender.tag]
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
    
    private func categoryButtonsChangeColor(buttonsArray: [UIButton], tag: Int){
        
        for (index,button) in buttonsArray.enumerated() {
            index == tag ? headerMenu.selectedCategory(button, isTapped: true) : headerMenu.selectedCategory(button, isTapped: false)
            
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionType = SectionType.init(rawValue: section)
        
        switch sectionType {
        case .banners:
            return 1
        default:
            return presenter.items?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        
        let sectionType = SectionType.init(rawValue: section)
        
        switch sectionType {
        case .banners:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.bannerTableViewCell, for: indexPath) as! BannerTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.tableViewCell, for: indexPath) as! TableViewCell
            if let item = presenter.items?[indexPath.row] {
                cell.configureMenuCell(title: item.title ?? "No info")
                cell.imageViewCell.imageFromUrl(urlString: item.image ?? "")
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionType = SectionType.init(rawValue: section)
        
        if sectionType != .banners {
            return headerMenu
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let sectionType = SectionType.init(rawValue: section)
        
        if sectionType ==  .banners {
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
