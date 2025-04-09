//
//  ApplicationReducer.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

typealias ApplicationReducer<State: ReduxState> = (_ state: State, _ action: Actions,_ sideEffect: ApplicationSideEffect, _ dispatcher: @escaping (Actions) -> Void) -> State

// MARK: APPLICATION REDUCER

func applicationReducer(
    state: ApplicationState,
    action: Actions,
    sideEffect: ApplicationSideEffect,
    dispatcher: @escaping (Actions) -> Void
) -> ApplicationState {
    var newState = state

    switch action {
    case .counterAction(let action):
        newState.counter = counterReducer(state: state.counter, action: action, sideEffect: sideEffect, dispatcher: dispatcher)
    case .taskAction(let action):
        newState.tasksList = taskReducer(state: state.tasksList, action: action)
    }

    return newState
}

// MARK: COUNTER FEATURE REDUCER
func counterReducer(
    state: CounterState,
    action: CounterActions,
    sideEffect: ApplicationSideEffect,
    dispatcher: @escaping (Actions) -> Void
) -> CounterState {
    var newState = state
    switch action {
    case .increment(let val):
        newState.value += val
        newState.calculating = false
    case .decrement(let val):
        newState.value -= val
        newState.calculating = false
    case .asyncIncrementAction:
        newState.calculating = true
        // call side effect which will execute asynchronously
        sideEffect.incrementService(dispatcher: dispatcher)
    case .asyncDecrementAction:
        newState.calculating = true
        // call side effect which will execute asynchronously
        sideEffect.decrementService(dispatcher: dispatcher)
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
        let newTask = Task(title: name)
        newState.tasks.append(newTask)
    }

    return newState
}
