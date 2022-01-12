//
//  Product.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 08.01.2022.
//

import Foundation

struct Product: Decodable, Identifiable{
    let id: Int
    let category: String
    let name: String
    let ingredients: String
    let calories: Int
    let price: Double
    let rate: Double
    let time: String
}
