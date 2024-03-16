//
//  AppStore.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import Foundation
import Combine

class ApplicationStore<T: ReduxState>: ObservableObject {
    var reducer: ApplicationReducer<T>
    @Published var state: T
    var middlewareList: [Middleware<T>]

    init(reducer: @escaping ApplicationReducer<T>, state: T, middlewares: [Middleware<T>]) {
        self.reducer = reducer
        self.state = state
        self.middlewareList = middlewares
    }
    
    func dispatch(action: Action) {
        // State must be updated on main thread
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }

        for middleware in middlewareList {
            middleware(self.state, action, dispatch)
        }
    }
}
