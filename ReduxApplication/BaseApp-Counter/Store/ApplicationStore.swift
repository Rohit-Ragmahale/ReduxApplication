//
//  AppStore.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import Foundation
import Combine

class ApplicationStore<T: ReduxState>: ObservableObject {
    private var reducer: ApplicationReducer<T>
    private var sideEffects: ApplicationSideEffect
    @Published var state: T

    init(reducer: @escaping ApplicationReducer<T>, sideEffects: ApplicationSideEffect, state: T) {
        self.reducer = reducer
        self.state = state
        self.sideEffects = sideEffects
    }

    func dispatch(action: Actions) {
        // State must be updated on main thread
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            state = reducer(state, action, sideEffects, dispatch)
        }
    }
}
