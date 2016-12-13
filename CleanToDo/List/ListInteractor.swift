//
//  ListInteractor.swift
//  CleanToDo
//

import UIKit

protocol ListInteractorInput {
    func loadTasks()
}

protocol ListInteractorOutput {
    func presentList(tasks: [Task])
}

class ListInteractor: ListInteractorInput
{
    var output: ListInteractorOutput!

    func loadTasks() {

        output.presentList(tasks: DataManager.shared.tasks)
    }
}
