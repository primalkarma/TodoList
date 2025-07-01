//
//  DetailView.swift
//  TodoList
//
//  Created by Parimal Devi on 30/06/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var todo: ToDo
    @State private var item = ""
    @State private var reminderIsOn = false
    @State private var completed = false
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!
    @State private var notes = ""
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss ) private var dismiss
    var body: some View {
        List {
             TextField("Enter Todo", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date: ", selection: $dueDate)
                .listRowSeparator(.hidden)
                .disabled(!reminderIsOn)
            Text("Notes:")
                .padding(.top)
            TextField("Notes", text: $notes , axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            Toggle("Set Reminder", isOn: $completed)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear() {
//            move data from todo object to lacal vars
            item = todo.item
            reminderIsOn = todo.reminderIsOn
            completed = todo.completed
            dueDate = todo.dueDate
            notes = todo.notes
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //Move values from local vars to todo object
                    todo.item = item
                    todo.reminderIsOn = reminderIsOn
                    todo.completed = completed
                    todo.dueDate = dueDate
                    todo.notes = notes
                    modelContext.insert(todo)
                    guard let _ = try? modelContext.save() else {
                        print("Error: save on detail view did not work")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(todo: ToDo())
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}
