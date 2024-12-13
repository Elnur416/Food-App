//
//  ProductsListViewModel.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 12.12.24.
//

import Foundation
import UIKit


class ProductsListViewModel {
    
    private var order = [Product]()
    private let adapter = FileAdapter()
    
    func readData() {
        adapter.readData { data in
            self.order = data
        }
    }
    func addItem(sender: UIButton, selectedMenu: MenuModel) -> Product {
        let index = sender.tag
        let selectedItem = selectedMenu.products?[index]
        order.append(selectedItem!)
        adapter.writeData(order: order)
        return selectedItem!
    }
}
