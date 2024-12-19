//
//  ProfileController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 10.12.24.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet private weak var fullnameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.readData()
        viewModel.getUserInfo(fullnameLabel: fullnameLabel, emailLabel: emailLabel, phoneLabel: phoneLabel)
    }
}
