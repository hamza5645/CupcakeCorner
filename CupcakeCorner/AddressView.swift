//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Hamza Osama on 09/05/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $order.name)
                        TextField("Street Address", text: $order.streetAddress)
                        TextField("City", text: $order.city)
                        TextField("Zip Code", text: $order.zip)
                    }
                }
                NavigationLink {
                    CheckOutView(order: order)
                } label: {
                    Rectangle()
                        .frame(width: 250, height: 70)
                        .foregroundColor(order.validAddress ? Color.green : Color.gray)
                        .cornerRadius(8)
                        .overlay(
                            Text("Check Out")
                                .foregroundColor(Color.primary)
                                .bold()
                        )
                }
                .disabled(order.validAddress == false )
                Spacer()
                Spacer()
            }
            .navigationTitle("Address")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
