//
//  MainCell.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 08.12.24.
//

import UIKit

class MainCell: UICollectionViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var itemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.isHidden = true
        itemPrice.isHidden = true
    }
    func configure(text: String, image: String, price: Double) {
        titleLabel.text = text
        titleImage.image = UIImage(named: image)
        itemPrice.text = String(price)
    }
   
    @IBAction func addButtonAction(_ sender: Any) {
       
    }
}



