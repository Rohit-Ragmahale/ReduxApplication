//
//  CounterViewModel.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 09/04/25.
//

struct ViewModel {
    var counter: Int
    var isCalculating: Bool
    var onIncrement: () -> Void
    var onDecrement: () -> Void
    var onAsyncIncrement: () -> Void
    var onAsyncDecrement: () -> Void

    static func map(store: ApplicationStore<ApplicationState>) -> ViewModel {
        ViewModel(
            counter: store.state.counter.value,
            isCalculating: store.state.counter.calculating,
            onIncrement: {
                store.dispatch(action: .counterAction(.increment(1)))
            },
            onDecrement: {
                store.dispatch(action: .counterAction(.decrement(1)))
            },
            onAsyncIncrement: {
                store.dispatch(action: .counterAction(.asyncIncrementAction))
            },
            onAsyncDecrement: {
                store.dispatch(action: .counterAction(.asyncDecrementAction))
            }
        )
    }
}
