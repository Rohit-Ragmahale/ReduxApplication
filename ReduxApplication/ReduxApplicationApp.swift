//
//  ReduxApplicationApp.swift
//  ReduxApplication
//
//  Created by Rohit Ragmahale on 15/03/24.
//

import SwiftUI
import Combine

@main
struct ReduxApplicationApp: App {
    var body: some Scene {
        
        let store = ApplicationStore<ApplicationState>(reducer: applicationReducer, state: ApplicationState(counter: CounterState(value: 0)), middlewares: [logMiddleWare(), incrementMiddleWare()])
        
        WindowGroup {
            CounterView()
                .environmentObject(store)
        }
    }
}
