//
//  ViewController.swift
//  Test-FoodDelivery-MainScreen
//
//  Created by Ксения Кобак on 13.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        navigationItem.title = "Меню"
        self.view = mainView
        mainView.bannerCollectionView.delegate = self
        mainView.bannerCollectionView.dataSource = self
        mainView.menuCollectionView.delegate = self
        mainView.menuCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
}

extension MainViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == mainView.bannerCollectionView {
            return  Data.bannerImagesArray.count
        } else  {
            return Data.buttonNamesArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.bannerCollectionView  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIDs.bannerCell, for: indexPath) as! BannerCell
            cell.bannerImageView.image = UIImage(named: Data.bannerImagesArray[indexPath.row])
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIDs.menuCell, for: indexPath) as! MenuCell
            cell.menuButton.configuration?.title = Data.buttonNamesArray[indexPath.row]
            return cell
        }
    }
    
}
