//
//  Todo.swift
//  TodoList
//
//  Created by Parimal Devi on 01/07/25.
//

import Foundation
import SwiftData

@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var completed = false
    var dueDate  = Date.now + 60*60*24
    //var dueDate = Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!
    var notes = ""
    
    init(item: String = "", reminderIsOn: Bool = false, completed: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "") {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.completed = completed
        self.dueDate = dueDate
        self.notes = notes
    }
}

