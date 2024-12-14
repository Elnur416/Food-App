//
//  FileManagerHelper.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 07.12.24.
//

import Foundation

class FileManagerHelper {
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("Users")
//      print(path)
        return path
    }
    func readData(completion: (([User]) -> Void)?) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion?(users)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func writeData(user: [User]) {
        do {
            let data = try JSONEncoder().encode(user)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
}
