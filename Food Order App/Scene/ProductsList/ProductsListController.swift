//
//  ProductsListController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 08.12.24.
//

import UIKit

class ProductsListController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    var selectedMenu: MenuModel?
    let productsListViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureCollectionView()
        productsListViewModel.readData()
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
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: "MainCell")
    }
    @objc func addItem(_ sender: UIButton) {
        let selectedItem = productsListViewModel.addItem(sender: sender, selectedMenu: selectedMenu!)
        let alert = UIAlertController(title: "Added", message: "\(selectedItem.name ?? "") added to order", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ProductsListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedMenu?.products?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.configure(text: selectedMenu?.products?[indexPath.row].name ?? "", image: selectedMenu?.products?[indexPath.row].image ?? "", price: selectedMenu?.products?[indexPath.row].price ?? 0)
        cell.itemPrice.isHidden = false
        cell.button.isHidden = false
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(addItem(_:)), for: .touchUpInside)
        return cell
    }
}
