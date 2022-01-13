//
//  NavigateBackView.swift
//  ResturantShop
//
//  Created by Марія Кухарчук on 13.01.2022.
//

import SwiftUI

struct NavigateBackView: View {
    var title: Text?
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    withAnimation {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .font(Font.title.weight(.bold))
                        .foregroundColor(Color.init(hex: "34835e"))
                        .padding()
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .padding(.leading)
                })
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NavigatorDefaultView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body : some View {
        Button(action: {
            withAnimation {
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(Color("TitleColor"))
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
