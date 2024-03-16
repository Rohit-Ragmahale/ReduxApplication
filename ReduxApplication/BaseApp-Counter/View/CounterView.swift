//
//  ContentView.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import SwiftUI

struct CounterView: View {
    @EnvironmentObject var store: ApplicationStore<ApplicationState>
    @State var isPresented: Bool = false
    struct Props {
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
            store.dispatch(action: IncrementAction())
        } onDecrement: {
            store.dispatch(action: DecrementAction())
        } onAsyncIncrement: {
            store.dispatch(action: AsyncIncrementAction())
        } onAsyncDecrement: {
            store.dispatch(action: AsyncDecrementAction())
        }
    }
    
    var body: some View {
        let props = map(state: store.state)
        
        VStack {
            Text("Counter: \(props.isCalculating ? "Calculating" :  "\(props.counter)")")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }
            Button("Async Increment") {
                props.onAsyncIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Async Decrement") {
                props.onAsyncDecrement()
            }
            .padding([.bottom], 50)
            Button("Add Task") {
                isPresented = true
            }
            
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
    CounterView().environmentObject(ApplicationStore(reducer: applicationReducer, state: ApplicationState(counter: CounterState(value: 0)), middlewares: [logMiddleWare(), incrementMiddleWare()]))
}
