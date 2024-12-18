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
    
    var selectedMenu: MenuModel?
    
    func readData() {
        adapter.readData { data in
            self.order = data
        }
    }
    func addItem(sender: UIButton, selectedMenu: MenuModel) -> Product? {
            let index = sender.tag
            guard let products = selectedMenu.products,
                  index >= 0,
                  index < products.count else {
                return nil
            }
        let selectedItem = products[index]
            if let existingIndex = order.firstIndex(where: { $0.id == selectedItem.id }) {
                order[existingIndex].quantity! += 1
            } else {
                order.append(selectedItem)
            }
            adapter.writeData(order: order)
        return selectedItem
        }
    }

