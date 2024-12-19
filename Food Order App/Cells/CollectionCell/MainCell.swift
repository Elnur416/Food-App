//
//  MainCell.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 08.12.24.
//

import UIKit

class MainCell: UICollectionViewCell {
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet private weak var itemPrice: UILabel!
    
    let viewModel = ProductsListViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.isHidden = true
        itemPrice.isHidden = true
    }
    
    func configure(text: String, image: String, price: Double, itemPriceIsHidden: Bool, plusButtonIsHidden: Bool, indexPath: IndexPath) {
        titleLabel.text = text
        titleImage.image = UIImage(named: image)
        itemPrice.text = String(price)
        itemPrice.isHidden = itemPriceIsHidden
        button.isHidden = plusButtonIsHidden
        button.tag = indexPath.row
    }
   
    @IBAction func addButtonAction(_ sender: Any) {
       
    }
}



