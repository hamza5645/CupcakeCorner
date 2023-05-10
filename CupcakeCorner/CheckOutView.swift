//
//  CheckOutView.swift
//  CupcakeCorner
//
//  Created by Hamza Osama on 10/05/2023.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
//        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Total Price is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    //
                }label: {
                    Rectangle()
                        .frame(width: 250, height: 70)
                        .foregroundColor(.green)
                        .cornerRadius(8)
                        .overlay(
                            Text("Pay")
                                .foregroundColor(Color.primary)
                                .bold()
                        )
                    
                }
                .padding()
            }
//        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckOutView(order: Order())
        }
    }
}
