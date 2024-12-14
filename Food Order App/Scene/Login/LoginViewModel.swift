//
//  LoginViewModel.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 11.12.24.
//

import Foundation
import UIKit

class LoginViewModel {
    private let manager = UserDefaultsManager()
    private let fileManager = FileManagerHelper()
    private var users = [User]()
    
    var success: (() -> Void)?
    var error: (() -> Void)?
    
    func readData() {
        fileManager.readData { usersData in
            self.users = usersData
        }
    }
    
    func loginAction(email: String, password: String) {
        readData()
        if users.contains(where: { $0.email == email && $0.password == password}) {
            manager.setValue(value: true, key: .isLoggedIn)
            success?()
        } else {
            error?()
        }
    }
    func getUserIndex(email: String, password: String) {
        guard let index = users.firstIndex(where: { $0.email == email && $0.password == password }) else { return }
        manager.setValue(value: index, key: .getUserIndex)
    }
}
