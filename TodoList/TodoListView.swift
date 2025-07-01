//
//  TodoListView.swift
//  TodoList
//
//  Created by Parimal Devi on 30/06/25.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Query var toDos: [ToDo]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { todo in
                    NavigationLink {
                        DetailView(todo: todo)
                    } label: {
                        Text(todo.item)
                    }

                    
                }.font(.title2)
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.plain)
            .fullScreenCover(isPresented: $sheetIsPresented, content: {
                NavigationStack {
                    DetailView(todo: ToDo())
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

#Preview {
    TodoListView()
        .modelContainer(for: ToDo.self, inMemory: true)
}
