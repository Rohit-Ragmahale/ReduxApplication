//
//  ApplicationReducer.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

protocol ReducerProtocol {
    associatedtype ReducerState
    associatedtype ReducerAction
    
    func handle(_ state: ReducerState, _ action: ReducerAction) -> ReducerState
}

struct AppReducer: ReducerProtocol {
    func handle(_ state: ApplicationState, _ action: AppActions) -> ApplicationState {
        var state = state
        switch action {
        case .IncrementAction(let val):
            state.counter.value += val
            state.counter.calculating = false
        case .DecrementAction(let val):
            state.counter.value -= val
            state.counter.calculating = false
        case .AsyncIncrementAction:
            state.counter.calculating = true
        case .AsyncDecrementAction:
            state.counter.calculating = true
        case .addNewTask(let name):
            state.tasksList.tasks.append(Task(title: name))
        }
        return state
    }
}
