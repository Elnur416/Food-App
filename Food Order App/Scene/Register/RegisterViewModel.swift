//
//  RegisterViewModel.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 11.12.24.
//

import Foundation

class RegisterViewModel {
    private var users = [User]()
    private let fileManager = FileManagerHelper()
    
    func readData() {
        fileManager.readData { usersData in
            self.users = usersData
        }
    }
    
    func register(user: User) {
        users.append(user)
        fileManager.writeData(user: users)
    }
}
