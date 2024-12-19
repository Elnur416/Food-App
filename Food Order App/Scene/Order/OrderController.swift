//
//  OrderController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 09.12.24.
//

import UIKit

class OrderController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var totalPrice: UILabel!
    
    let viewModel = OrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableCell()
        viewModel.readData(totalPrice: totalPrice)
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel.error = {
            let alert = UIAlertController(title: "Error", message: "No added items!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    func configureTableCell() {
        title = "Basket"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
        viewModel.confirmButtonAction()
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SuccessController.self)") as! SuccessController
        navigationController?.present(controller, animated: true)
        viewModel.getOrder(totalPrice: totalPrice, tableView: tableView)
    }
}

extension OrderController: UITableViewDataSource, UITableViewDelegate, TableCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.delegate = self
        cell.configure(product: viewModel.orderList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func didUpdateQuantity(product: Product, quantity: Int) {
        if let index = viewModel.orderList.firstIndex(where: { $0.id == product.id }) {
            if quantity == 0 {
                viewModel.orderList.remove(at: index)
                viewModel.writeData()
                tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            } else {
                viewModel.orderList[index].quantity = quantity
                viewModel.writeData()
            }
            let formattedPrice = viewModel.updateTotalPrice()
            totalPrice.text = formattedPrice
        }
    }
}
