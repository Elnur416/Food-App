//
//  MenuModel.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 07.12.24.
//

import Foundation

struct MenuModel: Codable {
    let name: String?
    let image: String?
    let products: [Product]?
}
struct Product: Codable {
    var id: String?
    let name: String?
    let image: String?
    let price: Double?
    var quantity: Int?
}

let menu: [MenuModel] = [.init(name: "Burger", image: "burger", products: [.init(id: "1", name: "Cheeseburger", image: "cheeseburger", price: 9.99, quantity: 1),
                                                                           .init(id: "2", name: "Buffalo burger", image: "buffaloBurger", price: 9.99, quantity: 1),
                                                                           .init(id: "3", name: "Salmon burger", image: "salmonBurger", price: 9.99, quantity: 1),
                                                                           .init(id: "4", name: "Steak burger", image: "steakBurger", price: 9.99, quantity: 1)]),
                         .init(name: "Asian", image: "asian", products: [.init(id: "5", name: "Beef and Broccoli", image: "beefAndBroccoli", price: 9.99, quantity: 1),
                                                                         .init(id: "6", name: "Chicken Yakitori", image: "chickenYakitori", price: 9.99, quantity: 1),
                                                                         .init(id: "7", name: "Chicken Katsu", image: "chickenKatsu", price: 9.99, quantity: 1),
                                                                         .init(id: "8", name: "Chicken Madras", image: "chickenMadras", price: 9.99, quantity: 1)]),
                         .init(name: "Italian", image: "italian", products: [.init(id: "9", name: "Chicken Parmesan", image: "chickenParmesan", price: 9.99, quantity: 1),
                                                                             .init(id: "10", name: "Chopped Sandwich", image: "choppedSandwich", price: 9.99, quantity: 1),
                                                                             .init(id: "11", name: "Chicken Piccata", image: "chickenPiccata", price: 9.99, quantity: 1),
                                                                             .init(id: "12", name: "Stromboli", image: "stromboli", price: 9.99, quantity: 1)]),
                         .init(name: "Dessert", image: "dessert", products: [.init(id: "13", name: "Carmelitas", image: "carmelitas", price: 9.99, quantity: 1),
                                                                             .init(id: "14", name: "Jell-O Cake", image: "jell-OCake", price: 9.99, quantity: 1),
                                                                             .init(id: "15", name: "Biscoff Trifle", image: "biscoffTrifle", price: 9.99, quantity: 1),
                                                                             .init(id: "16", name: "Chocolate Pizza", image: "chocolatePizza", price: 9.99, quantity: 1)]),
                         .init(name: "Salad", image: "salad", products: [.init(id: "17", name: "Beet Salad", image: "beetSalad", price: 9.99, quantity: 1),
                                                                         .init(id: "18", name: "Pasta Salad", image: "pastaSalad", price: 9.99, quantity: 1),
                                                                         .init(id: "19", name: "Tortellini Salad", image: "tortelliniSalad", price: 9.99, quantity: 1),
                                                                         .init(id: "20", name: "Orzo Salad", image: "orzoSalad", price: 9.99, quantity: 1)]),
                         .init(name: "Doner", image: "doner", products: [.init(id: "21", name: "Meat Doner", image: "meatDoner", price: 9.99, quantity: 1),
                                                                         .init(id: "22", name: "Chicken Doner", image: "chickenDoner", price: 9.99, quantity: 1),
                                                                         .init(id: "23", name: "Shawarma Doner", image: "shawarmaDoner", price: 9.99, quantity: 1),
                                                                         .init(id: "24", name: "Porsion Doner", image: "porsionDoner", price: 9.99, quantity: 1)])]
