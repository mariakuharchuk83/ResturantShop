//
//  FoodView.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 11.01.2022.
//

import SwiftUI

struct FoodView: View {
    let product: Product
    @State var amount: Int = 1
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView{
                    VStack{
                        HStack{
                            NavigateBackView()
                            Spacer()
                            NavigationLink(destination: CartView()){
                                Image(systemName: "cart.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .font(Font.title.weight(.bold))
                                    .foregroundColor(Color.init(hex: "34835e"))
                                    .padding(13)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                                    .padding(.trailing)
                            }
                        }
                        .padding(.top,40)
                        
                        Text("\(product.name)")
                            .font(Font.custom("HelveticaNeue-Bold", size: 26))
                            .padding(.leading)
                        
                        Image("\(product.category)-\(product.name)")
                            .resizable()
                            .frame(minWidth: 200, maxWidth: 300, minHeight: 200, maxHeight: 300)
                            .shadow(radius: 2)
                            
                        HStack{
                            Image("fire-emoji")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.leading)
                            Text("\(product.calories) calories")
                                .font(Font.custom("HelveticaNeue", size: 18))
                                .padding(.trailing)
                            Image("star-emoji")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("\(String(format: "%.1f", product.rate))")
                                .font(Font.custom("HelveticaNeue", size: 18))
                            Spacer()
                            Text("$")
                                .font(Font.custom("HelveticaNeue", size: 24))
                                .foregroundColor(Color.init(hex: "34835e"))
                            Text("\(String(format: "%.2f", product.price))")
                                .font(Font.custom("HelveticaNeue-Bold", size: 26))
                                .padding(.trailing)
                        }
                        .padding(.top)
                        
                        HStack{
                            Image("clock-emoji")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.leading)
                            Text("\(product.time) min")
                                .font(Font.custom("HelveticaNeue", size: 18))
                            Spacer()
                            
                            Button(action:{
                                if amount > 1 {
                                amount -= 1
                                }
                                else{
                                    amount = 1
                                }
                            }){
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 13, height: 2)
                                    .foregroundColor(.white)
                                    .padding(13)
                                    .background(Color.init(hex: "34835e"))
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            
                            Text("\(amount)")
                                .font(Font.custom("HelveticaNeue", size: 18))
                            
                            Button(action:{
                                amount += 1
                            }){
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.init(hex: "34835e"))
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .padding(.trailing)
                            
                        }
                       
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Ingredients:")
                                    .font(Font.custom("HelveticaNeue-Bold", size: 23))
                                    .padding(.top)
                                    .padding(.leading)
                            }
                            Text("\(product.ingredients)")
                                .font(Font.custom("HelveticaNeue", size: 18))
                                .frame(alignment: .leading)
                                .padding(.horizontal)
                        }
                        .padding(.bottom,100)
                    }
                   
                }
                HStack {
                    Button(action: {
                        
                    }){
                        Text("ADD TO CART")
                            .font(Font.custom("HelveticaNeue-Bold", size: 23))
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                            .frame(minWidth: 250, maxWidth: 350, minHeight: 20, maxHeight: 30, alignment: .bottom)
                            .padding()
                            .background(Color.init(hex: "34835e"))
                            .cornerRadius(10)
                    }
                    .shadow(radius: 3)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom,20)
            }
            .ignoresSafeArea()
        .background(Color.init(hex: "f7f7f7"))
    .navigationBarBackButtonHidden(true)
        }
                
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView( product: Products().primary )
    }
}
