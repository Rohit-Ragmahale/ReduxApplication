//
//  CounterState.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation

struct CounterState: ReduxState {
    var value: Int = 0
    var calculating: Bool = false
}
