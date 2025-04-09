//
//  ReduxState.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

// State must be maintained in separate files
// As of now as this is demo keeping it in same file for better understanding

protocol ReduxState {}

// MARK: APPLICATION STATE
struct ApplicationState: ReduxState {
    var counter: CounterState = CounterState(value: 0)
    var tasksList: TaskState = TaskState()
}

// MARK: COUNTER FEATURE STATE
struct CounterState: ReduxState {
    var value: Int = 0
    var calculating: Bool = false
}

// MARK: TASK FEATURE STATE
struct TaskState: ReduxState {
    var tasks: [Task] = []
}
