//
//  ContentView.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 05.01.2022.
//

import SwiftUI

struct HomeView: View {
    let info = Products()
    private let person = Person()
    private let foodCard: [FoodCardModel] = [FoodCardModel(cardImage: "pizza", cardText: "Pizza", id: 0), FoodCardModel(cardImage: "burger", cardText: "Burger", id: 1), FoodCardModel(cardImage: "sandwich", cardText: "Sandwich", id: 2), FoodCardModel(cardImage: "pasta", cardText: "Pasta", id: 3), FoodCardModel(cardImage: "drink", cardText: "Drink", id: 4)]
    
    @State var selectedBtn: Int = 0
    @State private var foodName: String = ""
    @State var selectedProducts: [Product] =  Products().getByCategory(selectedCategory: "pizza")
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false){
                    VStack{
                        HStack{
                            Text("\(person.firstName) \(person.lastName)")
                                .font(Font.custom("HelveticaNeue-Bold", size: 25))
                                .padding(.leading)
                            Spacer()
                            
                            NavigationLink(destination: Text("personView")){
                                Image("\(person.image)")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                                    .padding(.trailing)
                            }
                        }
                        
                        HStack{
                            Text("Let`s find quality food")
                                .font(Font.custom("HelveticaNeue", size: 18))
                                .padding(.leading)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        
                        HStack{
                            HStack{
                                Button(action:{}) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color.black)
                                }
                                
                                TextField("Search food...", text: $foodName)
                            }
                            .padding(.leading)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                            
                            NavigationLink(destination: Text("settings")){
                                HStack{
                                    
                                    Image(systemName: "slider.horizontal.3")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color.black)
                                    
                                }
                                .padding()
                                .background(Color.init(hex: "ffde83"))
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            Text("Categories")
                                .font(Font.custom("HelveticaNeue-Bold", size: 23))
                                .padding(.leading)
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                
                                ForEach(0 ..< 5) { i in
                                    Button(action: {
                                        self.selectedBtn = i
                                        self.selectedProducts = self.info.getByCategory(selectedCategory: self.foodCard[self.selectedBtn].cardImage)
                                    }){
                                        Image(foodCard[i].cardImage)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .shadow(radius: 2)
                                            .padding(5)
                                        
                                        
                                        Text(foodCard[i].cardText)
                                            .font(Font.custom("HelveticaNeue-Bold", size: 16))
                                            .foregroundColor(self.selectedBtn == i ? Color.white : Color.black)
                                            .padding(.trailing)
                                    }
                                    .background(self.selectedBtn == i ? Color.init(hex: "34835e") : Color.white)
                                    .cornerRadius(50)
                                    .shadow(radius: 3)
                                    .padding()
                                }
                            }
                        }
                    
                        HStack{
                            Text("Products")
                                .font(Font.custom("HelveticaNeue-Bold", size: 22))
                                .padding(.leading)
                            Spacer()
                            Text("The best quality")
                                .font(Font.custom("HelveticaNeue", size: 20))
                                .foregroundColor(Color.gray)
                                .padding(.trailing)
                        }
                        
                        
                        ForEach(0 ..< selectedProducts.count) { i in
                            NavigationLink(destination: FoodView(product: selectedProducts[i])){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(selectedProducts[i].name)")
                                        .font(Font.custom("HelveticaNeue-Bold", size: 19))
                                        .foregroundColor(.black)
                                    
                                    Text("\(selectedProducts[i].ingredients)")
                                        .font(Font.custom("HelveticaNeue", size: 16))
                                        .foregroundColor(Color.gray)
                                    
                                    HStack{
                                        Image("fire-emoji")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("\(selectedProducts[i].calories) calories")
                                            .font(Font.custom("HelveticaNeue", size: 16))
                                            .foregroundColor(Color.yellow)
                                    }
                                    
                                    Text("\(String(format: "%.2f", selectedProducts[i].price))$")
                                        .font(Font.custom("HelveticaNeue-Bold", size: 23))
                                        .foregroundColor(.black)
                                }
                                .padding()
                                
                                Image("\(selectedProducts[i].category)-\(selectedProducts[i].name)")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                        .shadow(radius: 3)
                            }
                        }
                    }
                    
                    HStack{
                        
                    }
                    
                }
                .padding(.top,43)
                .ignoresSafeArea()
                .background(Color.init(hex: "f7f7f7"))
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
