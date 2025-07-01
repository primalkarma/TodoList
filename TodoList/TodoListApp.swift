//
//  TodoListApp.swift
//  TodoList
//
//  Created by Parimal Devi on 30/06/25.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
