//
//  Profile.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 12.12.24.
//

import Foundation
import UIKit

class ProfileViewModel {
    private var user = [User]()
    private let fileManager = FileManagerHelper()
    private let manager = UserDefaultsManager()
    
    func readData() {
        fileManager.readData { userData in
            self.user = userData
        }
    }
    func getUserInfo(fullnameLabel: UILabel, emailLabel: UILabel, phoneLabel: UILabel) {
        let index = manager.getIndex(key: .getUserIndex)
        fullnameLabel.text = user[index].fullname
        emailLabel.text = user[index].email
        phoneLabel.text = user[index].phone
    }
}
