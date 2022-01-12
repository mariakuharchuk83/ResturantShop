//
//  Products.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 08.01.2022.
//

import Foundation

class Products: ObservableObject{
    let products:[Product]
    
    var primary:Product{
        products[0]
    }
    
    init(){
        let url=Bundle.main.url(forResource: "Products", withExtension: "json")!
        let data=try! Data(contentsOf: url)
        products=try! JSONDecoder().decode([Product].self, from: data)

    }
    
    func getByCategory(selectedCategory: String) -> [Product] {
        var neededProducts = [Product]()
        for product in products{
            if product.category == selectedCategory{
                neededProducts.append(product)
            }
        }
        return neededProducts
    }
    
}
