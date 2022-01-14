//
//  ResturantShopApp.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 05.01.2022.
//

import SwiftUI

@main
struct ResturantShopApp: App {
    @StateObject var products =  Products()
    var body: some Scene {
        WindowGroup {
            
            HomeView()
        }
    }
}
