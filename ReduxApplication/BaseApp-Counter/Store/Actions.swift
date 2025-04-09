//
//  Actions.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

// MARK: APPLICATION ACTION
enum Actions {
    case counterAction(CounterActions)
    case taskAction(TaskActions)
}

// MARK: COUNTER FEATURE ACTION
enum CounterActions {
    case increment(Int)
    case decrement(Int)
    case asyncIncrementAction
    case asyncDecrementAction
}

// MARK: TASK FEATURE ACTION
enum TaskActions {
    case addNew(String)
}
