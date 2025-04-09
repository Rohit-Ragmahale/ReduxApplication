//
//  ApplicationMiddleWare.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

typealias Dispatcher = (Actions) -> Void
// typealias SideEffect<State: ReduxState> = (State, Actions, @escaping Dispatcher) -> Void

// This class will be initialised with APIService to get data from API
class ApplicationSideEffect {

    // Logging service can be used for Adobe analytics
    func logger(action: Actions, dispatcher: @escaping Dispatcher) {
        print("[LOG] \(action.self)")
    }

    // Increment service
    func incrementService(dispatcher: @escaping Dispatcher) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            // Do async api call
            // Parse result
            // Create domain model
            // Pass to action
            let demoDomainModel: Int = 5
            dispatcher(Actions.counterAction(.increment(demoDomainModel)))
        })
    }

    // Decrement service
    func decrementService(dispatcher: @escaping Dispatcher) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let demoDomainModel: Int = 10
            dispatcher(Actions.counterAction(.decrement(demoDomainModel)))
        })
    }
}
