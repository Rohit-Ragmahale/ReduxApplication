//
//  CounterReducer.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {
    var state = state
    switch action {
    case let increment as IncrementAction:
        state.value += increment.val
        state.calculating = false
    case let decrement as DecrementAction:
        state.value -= decrement.val
        state.calculating = false
    case _ as AsyncIncrementAction:
        state.calculating = true
    case _ as AsyncDecrementAction:
        state.calculating = true
    default:
        break
    }
    return state
}
