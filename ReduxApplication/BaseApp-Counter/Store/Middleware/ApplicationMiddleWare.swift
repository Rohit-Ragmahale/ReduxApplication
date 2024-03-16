//
//  ApplicationMiddleWare.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

typealias Dispatcher = (Action) -> Void
typealias Middleware<State: ReduxState> = (State, Action, @escaping Dispatcher) -> Void

func logMiddleWare() -> Middleware<ApplicationState>  {
    return {state, action, dispatcher in
        print("[LOG] \(action.self)")
    }
}

func incrementMiddleWare() -> Middleware<ApplicationState>  {
    return {state, action, dispatcher in
        switch action {
        case _ as AsyncIncrementAction:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                dispatcher(IncrementAction(val: 5))
            })
        case _ as AsyncDecrementAction:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                dispatcher(DecrementAction(val: 5))
            })
        default:
            break
        }
    }
}

