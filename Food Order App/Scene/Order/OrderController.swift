//
//  OrderController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 09.12.24.
//

import UIKit

class OrderController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    let orderViewModel = OrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Basket"
        configureTableCell()
        orderViewModel.readData(totalPrice: totalPrice)
       
    }
    
    func configureTableCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    }
    @IBAction func confirmButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SuccessController.self)") as! SuccessController
        navigationController?.present(controller, animated: true)
        orderViewModel.getOrder(totalPrice: totalPrice, tableView: tableView)
    }
}

extension OrderController: UITableViewDataSource, UITableViewDelegate, TableCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderViewModel.orderList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.delegate = self
        cell.configure(product: orderViewModel.orderList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func didUpdateQuantity(product: Product, quantity: Int) {
        if let index = orderViewModel.orderList.firstIndex(where: { $0.id == product.id }) {
            if quantity == 0 {
                orderViewModel.orderList.remove(at: index)
                orderViewModel.writeData()
                tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            } else {
                orderViewModel.orderList[index].quantity = quantity
                orderViewModel.writeData()
            }
            let formattedPrice = orderViewModel.updateTotalPrice()
            totalPrice.text = formattedPrice
        }
    }
}
