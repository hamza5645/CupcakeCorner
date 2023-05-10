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
    
    var validAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        } else {
            return true 
        }
    }
    
    var cost: Double {
        //2$ per cake
        var cost = Double(quantity) * 2
        
        //complicated cakes cost more
        cost += (Double(type) / 2)
        
        //1$ for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        //0.5$ for Sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        if addMurshmello {
            cost += Double(quantity)
        }
        
        return cost
    }
}
