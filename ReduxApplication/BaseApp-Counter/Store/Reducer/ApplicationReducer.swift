//
//  ApplicationReducer.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

typealias ApplicationReducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

func applicationReducer(_ state: ApplicationState, _ action: Action) -> ApplicationState {
    var state = state
    state.counter = counterReducer(state.counter, action)
    state.tasksList = taskReducer(state: state.tasksList, action: action)
    return state
}
