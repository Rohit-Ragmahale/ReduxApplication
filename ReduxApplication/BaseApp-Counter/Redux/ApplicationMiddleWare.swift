//
//  ApplicationMiddleWare.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import Foundation
import Combine

protocol SideffectProtocol {
    associatedtype SideeffectState
    associatedtype SideffectAction

    func handle(_ state: SideeffectState, _ action: SideffectAction) throws -> AnyPublisher<SideffectAction?, Never>?
}

class IncrementSideffect: SideffectProtocol {
    func handle(_ state: ApplicationState, _ action: AppActions) throws -> AnyPublisher<AppActions?, Never>? {
        print("[LOG] \(action.self)")
        switch action {
        case .AsyncIncrementAction:
            return Just(AppActions.IncrementAction(val: 2))
                .delay(for: 2, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        case .AsyncDecrementAction:
            return Just(AppActions.DecrementAction(val: 2))
                .delay(for: 2, scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        default:
            break
        }
        return nil
    }
}
