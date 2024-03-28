//
//  AddTaskView.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 16/03/24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var store: AppStore
    @State var newTask: String = ""
    
    private struct Props {
        var tasks: [Task]
        var addTask: (String) -> Void
    }
    
    private func map(state: TaskState) -> Props {
        return Props(tasks: state.tasks) { newTask in
            store.dispatch(action: .addNewTask(name: newTask))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.tasksList)
        
        VStack {
            TextField("Enter Task", text: $newTask)
                .modifier(CustomThemeModifier())
                .padding([.top], 50)
            Button("Add Task") {
                props.addTask(newTask)
                newTask = ""
            }
            .modifier(CustomThemeModifier())
            .padding([.bottom], 50)
            
            Text("TaskList").modifier(CustomThemeModifier())
            List(props.tasks, id: \.self) {item in
                Text("\(item.title)")
                    .modifier(CustomThemeModifier())
            }
            
            Spacer()
        }
    }
}

#Preview {
    let state = ApplicationState(counter: CounterState(value: 0))
    let reducer = AppReducer()
    let sideEffect = IncrementSideffect()
    let store = AppStore(reducer: reducer, state: state, sideEffect: sideEffect)
    
    return AddTaskView().environmentObject(store)
}
