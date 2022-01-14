//
//  Order.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 13.01.2022.
//

import Foundation

struct Order {
    var products: [Product] = Products().getByCategory(selectedCategory: "burger")
    var price: Double{
        get{
            var price: Double = 0
            for product in products {
                price = price + product.price
            }
            return price
        }
        set{
            var price: Double = 0
            price = newValue
        }
    }
}
