//
//  CreateTaskInteractor.swift
//  CleanToDo
//

import UIKit

protocol CreateTaskInteractorInput {
    func createTask(withRequest request: CreateTask.Request)
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

    func createTask(withRequest request: CreateTask.Request) {

        if worker.validateTask(withRequest: request) {
            worker.saveTask(withTitle: request.title, dueDate: dueDate)
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
