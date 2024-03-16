//
//  ApplicationState.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

struct ApplicationState: ReduxState {
    var counter: CounterState = CounterState(value: 0)
    var tasksList: TaskState = TaskState()
}

