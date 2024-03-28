//
//  Actions.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

enum AppActions: Equatable {
    case IncrementAction(val: Int)
    case DecrementAction(val: Int)
    case AsyncIncrementAction
    case AsyncDecrementAction
    
    case addNewTask(name: String)
}
