//
//  Order.swift
//  CupcakeCorner
//
//  Created by Hamza Osama on 09/05/2023.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberrie", "Chocolate", "Mango", "Lemon", "Rainbow"]
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestsEnabled = false {
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
                addMurshmello = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    @Published var addMurshmello = false
    //Delivery
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
}
