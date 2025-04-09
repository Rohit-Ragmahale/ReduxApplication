//
//  AddTaskView.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var store: ApplicationStore<ApplicationState>
    @State var newTask: String = ""
    
    // Kept this another approch to map state data to view
    struct Props {
        var tasks: [TodoTask]
        var addTask: (String) -> Void
    }

    private func map(state: TaskState) -> Props {
        return Props(tasks: state.tasks) { newTask in
            store.dispatch(action: .taskAction(.addNew(newTask)))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.tasksList)
        
        VStack {
            TextField("Enter Task", text: $newTask)
                .padding()
                .padding([.top], 50)
            Button("Add Task") {
                store.dispatch(action: .taskAction(.addNew(newTask)))
                newTask = ""
            }.padding([.bottom], 50)
            
            Text("TaskList")
            List(props.tasks, id: \.self) {item in
                Text("\(item.title)")
            }
            Spacer()
        }
    }
}

#Preview {
    AddTaskView().environmentObject(
        ApplicationStore(
            reducer: applicationReducer,
            sideEffects: ApplicationSideEffect(),
            state: ApplicationState()
        )
    )
}
