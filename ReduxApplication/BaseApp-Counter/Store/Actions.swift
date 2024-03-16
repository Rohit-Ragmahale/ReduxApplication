//
//  Actions.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

protocol Action {}

// COUNTER
protocol CounterAction: Action {}
struct IncrementAction: CounterAction {
    var val: Int = 1
}
struct DecrementAction: CounterAction {
    var val: Int = 1
}
struct AsyncIncrementAction: CounterAction {}
struct AsyncDecrementAction: CounterAction {}

// TASK
protocol TaskAction: Action {}
struct addNewTask: TaskAction {
    var name: String
}
