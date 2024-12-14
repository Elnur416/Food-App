//
//  FileAdapter.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 08.12.24.
//

import Foundation

class FileAdapter {
    
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("Order.json")
//      print(path)
        return path
    }
    func readData(completion: (([Product]) -> Void)?) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let order = try JSONDecoder().decode([Product].self, from: data)
                completion?(order)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func writeData(order: [Product]) {
        do {
            let data = try JSONEncoder().encode(order)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
}
