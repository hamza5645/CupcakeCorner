//
//  CheckOutView.swift
//  CupcakeCorner
//
//  Created by Hamza Osama on 10/05/2023.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var ShowingErrorMessage = false
    
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
                    Task {
                        await placeOrder()
                    }
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
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("Ok") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Error while checking out" ,isPresented: $ShowingErrorMessage) {
            
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order.")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) Cupcakes is on it's way "
            showingConfirmation = true
        } catch {
            ShowingErrorMessage = true
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckOutView(order: Order())
        }
    }
}
