//
//  TableCell.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 09.12.24.
//

import UIKit

protocol TableCellDelegate: AnyObject {
    func didUpdateQuantity(product: Product, quantity: Int)
}

class TableCell: UITableViewCell {
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var titlePrice: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperCount: UILabel!
    
    var delegate: TableCellDelegate?
    
    var product: Product?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stepper.value = 1
        stepper.stepValue = 1
        stepper.minimumValue = 0
        stepper.addTarget(self, action: #selector (updateValue), for: .valueChanged)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(product: Product) {
        self.product = product
        stepper.value = Double(product.quantity ?? 0)
        titleName.text = product.name
        stepperCount.text = "\(product.quantity ?? 0)"
        titleImage.image = UIImage(named: product.image ?? "")
        titlePrice.text = String((product.price ?? 0) * Double(product.quantity ?? 0))
    }
    
    @objc func updateValue(_ sender: UIStepper) {
        guard let product = product else { return }
               let newQuantity = Int(sender.value)
               stepperCount.text = "\(newQuantity)"
        titlePrice.text = String((product.price ?? 0) * Double(newQuantity))
        delegate?.didUpdateQuantity(product: product, quantity: newQuantity)
    }
}
