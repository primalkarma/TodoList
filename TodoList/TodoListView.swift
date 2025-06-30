//
//  TodoListView.swift
//  TodoList
//
//  Created by Parimal Devi on 30/06/25.
//

import SwiftUI

struct TodoListView: View {
    var todos = ["Learn Swift",
                 "Build Apps",
                 "Change the world",
                 "Bring the awesome",
                 "Take a vacation"]
    @State private var sheetIsPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos, id: \.self) { todo in
                    NavigationLink {
                        DetailView(todo: todo)
                    } label: {
                        Text(todo)
                    }

                    
                }.font(.title2)
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.plain)
            .fullScreenCover(isPresented: $sheetIsPresented, content: {
                NavigationStack {
                    DetailView(todo: "")
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
}
