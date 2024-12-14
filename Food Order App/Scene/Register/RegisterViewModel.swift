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
    private let manager = UserDefaultsManager()
    
    var error: (() -> Void)?
    
    func readData() {
        fileManager.readData { usersData in
            self.users = usersData
        }
    }
    
    func register(user: User) {
        if users.contains(where: { $0.fullname == user.fullname && $0.email == user.email && $0.password == user.password && $0.phone == user.phone}) {
            error?()
        } else {
            users.append(user)
            fileManager.writeData(user: users)
        }
    }
}
