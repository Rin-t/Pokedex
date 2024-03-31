//
//  HomeReducer.swift
//  Pokedex
//
//  Created by Rin on 2024/03/31.
//

import Foundation
import ComposableArchitecture


@Reducer
struct HomeReducer {
    
    @ObservableState
    struct State: Equatable {

    }

    enum Action: Equatable {
        
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            }
        }
    }
}
