//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Hamza Osama on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://developer.apple.com/swift/images/swift-og.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading the image.")
            } else {
                ProgressView()
            }
        }
//        .frame(width: 500, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
