//
//  ApplicationState.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation
protocol StateProtocol {}

struct ApplicationState: StateProtocol {
    var counter: CounterState = CounterState(value: 0)
    var tasksList: TaskState = TaskState()
}

struct CounterState: StateProtocol {
    var value: Int = 0
    var calculating: Bool = false
}

struct TaskState: StateProtocol {
    var tasks: [Task] = []
}
