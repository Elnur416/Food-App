//
//  OrderViewModel.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 12.12.24.
//

import Foundation
import UIKit

class OrderViewModel {
    var orderList = [Product]()
    private let adapter = FileAdapter()
    var error: (() -> Void)?
    
    func readData(totalPrice: UILabel) {
        adapter.readData { data in
            self.orderList = data
            let formattedPrice = self.updateTotalPrice()
            totalPrice.text = "\(formattedPrice)"
        }
    }
    
    func writeData() {
        adapter.writeData(order: orderList)
    }
    
    func updateTotalPrice() -> String {
        let total = orderList.reduce(0) { $0 + (($1.price ?? 0) * Double($1.quantity ?? 1)) }
        let formattedPrice = String(format: "%.2f", total)
        return formattedPrice
    }
    
    func getOrder(totalPrice: UILabel, tableView: UITableView) {
        orderList.removeAll()
        adapter.writeData(order: orderList)
        let formattedPrice = self.updateTotalPrice()
        totalPrice.text = "\(formattedPrice)"
        tableView.reloadData()
    }
    
    func confirmButtonAction() {
        if orderList.isEmpty {
            error?()
        } 
    }
}
