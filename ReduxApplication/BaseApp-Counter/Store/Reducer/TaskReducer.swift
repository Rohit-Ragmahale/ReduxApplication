//
//  TaskReducer.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

func taskReducer(state: TaskState, action: Action) -> TaskState {
    var state = state
    
    switch action {
    case let newTask as addNewTask:
        state.tasks.append(Task(title: newTask.name))
    default:
        break
    }
    
    return state
}
