//
//  CreateTaskInteractor.swift
//  CleanToDo
//

import UIKit

protocol CreateTaskInteractorInput {
    func createTask(withTitle title: String?)
    func pick(dueDate: Date)
}

protocol CreateTaskInteractorOutput {
    func taskSaved()
    func invalidTask()
    func updateDateButton(withDate date: Date)
}

class CreateTaskInteractor: CreateTaskInteractorInput
{
    var output: CreateTaskInteractorOutput!
    var worker = CreateTaskWorker()
    var dueDate: Date?

    func createTask(withTitle title: String?) {

        if worker.validateTask(withTitle: title) {
            worker.saveTask(withTitle: title, dueDate: dueDate)
            output.taskSaved()
        } else {
            output.invalidTask()
        }
    }

    func pick(dueDate: Date) {
        self.dueDate = dueDate
        output.updateDateButton(withDate: dueDate)
    }
}
