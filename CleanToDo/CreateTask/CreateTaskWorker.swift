//
//  CreateTaskWorker.swift
//  CleanToDo
//

import UIKit

class CreateTaskWorker {

    func validateTask(withTitle title: String?) -> Bool {
        guard let title = title else {
            return false
        }

        return title.characters.count > 0
    }

    func saveTask(withTitle title: String?, dueDate: Date?) {
        guard let title = title else {
            return
        }

        let task = Task(title: title, date: dueDate)
        DataManager.shared.save(task: task)
    }
}
