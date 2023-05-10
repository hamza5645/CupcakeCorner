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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
