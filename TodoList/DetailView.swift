//
//  DetailView.swift
//  TodoList
//
//  Created by Parimal Devi on 30/06/25.
//

import SwiftUI

struct DetailView: View {
    @State var todo: String
    @State private var reminderIsOn = false
    @State private var completed = false
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!
    @State private var notes = ""
    
    @Environment(\.dismiss ) private var dismiss
    var body: some View {
        List {
             TextField("Enter Todo", text: $todo)
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
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //TODO: Add save code here
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(todo: "")
    }
}
