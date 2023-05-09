//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Hamza Osama on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type.", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes \(order.quantity)", value: $order.quantity, in: 1...30)
                }
                Section {
                    Toggle("Extras", isOn: $order.specialRequestsEnabled.animation())
                    
                    if order.specialRequestsEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.addSprinkles)
                        Toggle("Add marshmello", isOn: $order.addMurshmello)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
