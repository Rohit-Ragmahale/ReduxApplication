//
//  ApplicationReducer.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//
import Foundation

typealias ApplicationReducer<State: ReduxState> = (_ state: State, _ action: ApplicationActions,_ sideEffect: ApplicationSideEffect, _ dispatcher: @escaping (ApplicationActions) -> Void) -> State

// MARK: APPLICATION REDUCER
func applicationReducer(
    state: ApplicationState,
    action: ApplicationActions,
    sideEffect: ApplicationSideEffect,
    dispatcher: @escaping (ApplicationActions) -> Void
) -> ApplicationState {
    var newState = state

    switch action {
    case .counterAction(let action):
        // update counter state
        newState.counter = counterReducer(state: state.counter, action: action, sideEffect: sideEffect, dispatcher: dispatcher)
    case .taskAction(let action):
        // update task state
        newState.tasksList = taskReducer(state: state.tasksList, action: action)
    }

    return newState
}

// MARK: COUNTER FEATURE REDUCER
func counterReducer(
    state: CounterState,
    action: CounterActions,
    sideEffect: ApplicationSideEffect,
    dispatcher: @escaping (ApplicationActions) -> Void
) -> CounterState {
    var newState = state
    switch action {
    case .increment(let val):
        // increment business logic
        newState.value += val
        newState.calculating = false
    case .decrement(let val):
        // decrement business logic
        newState.value -= val
        newState.calculating = false
    case .asyncIncrementAction:
        // asyncIncrementAction business logic
        newState.calculating = true
        Task {
            // call side effect which will execute asynchronously
            sideEffect.incrementService(dispatcher: dispatcher)
        }
    case .asyncDecrementAction:
        // asyncDecrementAction business logic
        newState.calculating = true
        Task {
            // call side effect which will execute asynchronously
            sideEffect.decrementService(dispatcher: dispatcher)
        }
    }
    return newState
}

// MARK: TASK FEATURE REDUCER
func taskReducer(
    state: TaskState,
    action: TaskActions
) -> TaskState {
    var newState = state

    switch action {
    case .addNew(let name):
        // business logic
        let newTask = TodoTask(title: name)
        newState.tasks.append(newTask)
    }

    return newState
}
