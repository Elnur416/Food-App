//
//  ProfileController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 10.12.24.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let profileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileViewModel.readData()
        profileViewModel.getUserInfo(fullnameLabel: fullnameLabel, emailLabel: emailLabel, phoneLabel: phoneLabel)
    }
}
