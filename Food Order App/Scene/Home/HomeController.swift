//
//  HomeController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 07.12.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet private weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
        configureCollectionView()
        configureNavigationBar()
    }
    
    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 40, left: 40, bottom: 0, right: 40)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collection.collectionViewLayout = layout
    }
    func configureCollectionView() {
        title = "Menu"
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: "MainCell")
    }
    
    func configureNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket"), style: .plain, target: self, action: #selector (showOrder))
        self.navigationItem.rightBarButtonItem?.tintColor = .red
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector (showProfile))
        navigationItem.leftBarButtonItem?.tintColor = .red
        navigationController?.navigationBar.tintColor = .red
    }
    
    @objc func showProfile() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(ProfileController.self)") as! ProfileController
        navigationController?.present(controller, animated: true)
    }
    
    @objc func showOrder() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(OrderController.self)") as! OrderController
        navigationController?.show(controller, sender: nil)
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.configure(text: menu[indexPath.row].name ?? "", image: menu[indexPath.row].image ?? "", price: 0, itemPriceIsHidden: true, plusButtonIsHidden: true, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(ProductsListController.self)") as! ProductsListController
        controller.viewModel.selectedMenu = menu[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}











