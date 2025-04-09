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

    var body: some View {
        let viewModel = ViewModel.map(store: store)

        VStack {
            Text("Counter: \(viewModel.isCalculating ? "Calculating" :  "\(viewModel.counter)")")
                .padding()
            Button("Increment") {
                viewModel.onIncrement()
            }
            Button("Async Increment") {
                viewModel.onAsyncIncrement()
            }
            Button("Decrement") {
                viewModel.onDecrement()
            }
            Button("Async Decrement") {
                viewModel.onAsyncDecrement()
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
    CounterView().environmentObject(
        ApplicationStore(
            reducer: applicationReducer,
            sideEffects: ApplicationSideEffect(),
            state: ApplicationState(counter: CounterState(value: 0))
        )
    )
}
