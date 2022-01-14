//
//  CartView.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 13.01.2022.
//

import SwiftUI

struct CartView: View {
    
   
    private let person = Person()
    
    
    @State var order = Order()
    @State var price: Double = Order().price
    @State var amount: [Int] = [Int](repeating:  1, count: Order().products.count)
    
    var body: some View {
        VStack{
            HStack{
                NavigateBackView()
                Spacer()
                Text("Cart")
                    .font(Font.custom("HelveticaNeue-Bold", size: 26))
                    Spacer()
                NavigationLink(destination: Text("personView")){
                    Image("\(person.image)")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                        .padding(.trailing)
                }
            }
            .padding(.top,60)
            
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(0 ..< order.products.count) { i in
                        HStack{
                            Image("\(order.products[i].category)-\(order.products[i].name)")
                                .resizable()
                                .frame(minWidth: 115, maxWidth: 120, minHeight: 115, maxHeight: 120)
                                .shadow(radius: 6)
                            
                            VStack(alignment: .leading){
                                Text("\(order.products[i].name)")
                                    .font(Font.custom("HelveticaNeue-Bold", size: 23))
                                    .frame(width: 180, alignment: .leading)
                                Text("\(order.products[i].ingredients)")
                                    .font(Font.custom("HelveticaNeue", size: 18))
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 130, maxWidth: 180, maxHeight: 20, alignment: .leading)
                                Text("$\(String(format: "%.2f", order.products[i].price))")
                                    .font(Font.custom("HelveticaNeue-Bold", size: 26))
                            }
                            
                            VStack{
                                Button(action:{
                                    if amount[i] > 1 {
                                        amount[i] -= 1
                                       
                                            order.price = order.price - order.products[i].price
                                        
                                        price = price - order.products[i].price
                                    }
                                    else{
                                        amount[i] = 1
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
                                
                                Text("\(amount[i])")
                                    .font(Font.custom("HelveticaNeue", size: 20))
                                
                                Button(action:{
                                    amount[i] += 1
                                   
                                        order.price = order.price + order.products[i].price
                                    
                                    price = price + order.products[i].price
                                    
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
                            }
                            
                        }
                        .padding(.trailing)
                        .background(.white)
                        .cornerRadius(60, corners: [.topLeft,.bottomLeft])
                        .cornerRadius(10, corners: [.topRight,.bottomRight])
                        .frame(minWidth: 350, maxWidth: 430)
                        .shadow(radius: 3)
                        .padding()
                    }
                    
                }
                
                
                
                
                
                
                
            }
            
            VStack {
                List{
                    HStack{
                        Text("Subtotal")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            
                        Spacer()
                        Text("$\(String(format: "%.2f", price))")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            
                    }
                    
                    HStack{
                        Text("Delivery")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            
                        Spacer()
                        Text("Free")
                            .font(Font.custom("HelveticaNeue", size: 20))
                            
                    }
                    
                    HStack{
                        Text("Total")
                            .font(Font.custom("HelveticaNeue-Bold", size: 20))
                           
                        Spacer()
                        Text("$\(String(format: "%.2f", price))")
                            .font(Font.custom("HelveticaNeue-Bold", size: 20))
                    }
                }
                
                HStack {
                    Button(action: {}){
                        Text("CECKOUT")
                            .font(Font.custom("HelveticaNeue-Bold", size: 23))
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                            .frame(minWidth: 200, maxWidth: 350, minHeight: 20, maxHeight: 30, alignment: .bottom)
                            .padding()
                            .background(Color.init(hex: "34835e"))
                            .cornerRadius(10)
                    }
                    .shadow(radius: 3)
                }
                
            }
            .frame(height: 250, alignment: .bottom)
            .padding(.bottom,20)
            .cornerRadius(10, corners: [.topLeft, .topRight])
            
        }
        .ignoresSafeArea()
        .background(Color.init(hex: "f7f7f7"))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
