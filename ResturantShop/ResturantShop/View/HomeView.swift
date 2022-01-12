//
//  HomeView.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 05.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack{
            
            HStack{
                Text("Let`s find quality food")
                    .font(Font.custom("HelveticaNeue", size: 18))
                    .padding(.leading)
                    .foregroundColor(Color.gray)
                Spacer()
            }
            
            
            HStack{
                Text("Categories")
                    .font(Font.custom("HelveticaNeue-Bold", size: 23))
                    .padding(.leading)
                Spacer()
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



