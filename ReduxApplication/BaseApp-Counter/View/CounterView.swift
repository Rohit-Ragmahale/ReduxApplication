//
//  ContentView.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import SwiftUI

struct CounterView: View {
    @EnvironmentObject var store: AppStore
    @State var isPresented: Bool = false

    private struct Props {
        var counter: Int
        var isCalculating: Bool
        var onIncrement: () -> Void
        var onDecrement: () -> Void
        var onAsyncIncrement: () -> Void
        var onAsyncDecrement: () -> Void
    }
    
    private func map(state: ApplicationState) -> Props {
        return Props(counter: state.counter.value,
                     isCalculating: state.counter.calculating) {
            store.dispatch(action: .IncrementAction(val: 1))
        } onDecrement: {
            store.dispatch(action: .DecrementAction(val: 1))
        } onAsyncIncrement: {
            store.dispatch(action: .AsyncIncrementAction)
        } onAsyncDecrement: {
            store.dispatch(action: .AsyncDecrementAction)
        }
    }
    
    var body: some View {
        let props = map(state: store.state)
        
        VStack {
            Text("Counter: \(props.isCalculating ? "Calculating" :  "\(props.counter)")")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }.buttonStyle(CustomButtonStyle())
            Button("Async Increment") {
                props.onAsyncIncrement()
            }.buttonStyle(CustomButtonStyle())
            Button("Decrement") {
                props.onDecrement()
            }.buttonStyle(CustomButtonStyle())
            Button("Async Decrement") {
                props.onAsyncDecrement()
            }.buttonStyle(CustomButtonStyle())
            .padding([.bottom], 50)
            Button("Add Task") {
                isPresented = true
            }.buttonStyle(CustomButtonStyle())
            
            List(store.state.tasksList.tasks, id: \.self) { item in
                Text("\(item.title)")
            }
            
        }.sheet(isPresented: $isPresented, content: {
            AddTaskView()
        })
        .padding()
    }
}

#Preview {
    let state = ApplicationState(counter: CounterState(value: 0))
    let reducer = AppReducer()
    let sideEffect = IncrementSideffect()
    let store = AppStore(reducer: reducer, state: state, sideEffect: sideEffect)

    return CounterView().environmentObject(store)
}
