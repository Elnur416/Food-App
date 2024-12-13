//
//  Profile.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 12.12.24.
//

import Foundation
import UIKit

class ProfileViewModel {
    var user = [User]()
    let fileManager = FileManagerHelper()
    
    func readData() {
        fileManager.readData { userData in
            self.user = userData
        }
    }
    func getUserInfo(fullnameLabel: UILabel, emailLabel: UILabel, phoneLabel: UILabel) {
        fullnameLabel.text = user[user.count - 1].fullname
        emailLabel.text = user[user.count - 1].email
        phoneLabel.text = user[user.count - 1].phone
    }
}
