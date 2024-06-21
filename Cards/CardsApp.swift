//
//  CardsApp.swift
//  Cards
//
//  Created by romashka on 12.06.2024.
//

import SwiftUI

@main
struct CardsApp: App {

    @StateObject var store = CardStore()

    var body: some Scene {
        WindowGroup {
            CardsListView()
                .environmentObject(store)
                .onAppear {
                    print(URL.documentsDirectory)
                }
        }
    }
}



