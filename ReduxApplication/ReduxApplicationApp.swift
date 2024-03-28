//
//  ReduxApplicationApp.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import SwiftUI
import Combine

@main
struct ReduxApplicationApp: App {
    var body: some Scene {
        
        let state = ApplicationState(counter: CounterState(value: 0))
        let reducer = AppReducer()
        let sideEffect = IncrementSideffect()
        let store = AppStore(reducer: reducer, state: state, sideEffect: sideEffect)
        WindowGroup {
            CounterView()
                .environmentObject(store)
        }
    }
}
