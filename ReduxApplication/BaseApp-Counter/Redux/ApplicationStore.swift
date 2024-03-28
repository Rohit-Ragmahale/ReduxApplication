//
//  AppStore.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import Foundation
import Combine

typealias AppStore = ApplicationStore<ApplicationState, AppActions, AppReducer, IncrementSideffect>

class ApplicationStore<S, A, R: ReducerProtocol, FX: SideffectProtocol>: ObservableObject
where R.ReducerAction == A, R.ReducerState == S, FX.SideeffectState == S, FX.SideffectAction == A
    {
    @Published var state: S
    private var reducer: R
    private var sideEffect: FX
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(reducer: R, state: S, sideEffect: FX) {
        self.reducer = reducer
        self.state = state
        self.sideEffect = sideEffect
    }
    
    func dispatch(action: A) {
        // State must be updated on main thread
        DispatchQueue.main.async {
            self.state = self.reducer.handle(self.state, action)
        }
        do {
            if let fxPublisher = try sideEffect.handle(self.state, action) {
                fxPublisher
                    .receive(on: RunLoop.main)
                    .sink  { [weak self] newAction in
                        guard let self = self else { return }
                        if let newAction = newAction {
                            self.dispatch(action: newAction)
                        }
                    }.store(in: &subscriptions)
                
            }
        } catch {
            assertionFailure("Error with SideEffect \(error)")
        }
        
        
    }
}
