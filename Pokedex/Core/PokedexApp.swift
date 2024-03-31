//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Rin on 2024/03/26.
//

import SwiftUI
import ComposableArchitecture

@main
struct PokedexApp: App {

    static let store = Store(initialState: HomeReducer.State()) {
        HomeReducer()
    }

    var body: some Scene {
        WindowGroup {
            HomeView(store: Self.store)
        }
    }
}
