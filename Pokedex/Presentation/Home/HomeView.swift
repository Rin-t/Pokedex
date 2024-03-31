//
//  ContentView.swift
//  Pokedex
//
//  Created by Rin on 2024/03/26.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {

    let store: StoreOf<HomeReducer>

    var body: some View {
        VStack {
            Image(systemName: "globe")
        }
        .padding()
    }
}

#Preview {
    let store = Store(initialState: HomeReducer.State()) {
        HomeReducer()
    }
    return HomeView(store: store)
}
