//
//  ListInteractor.swift
//  CleanToDo
//

import UIKit

protocol ListInteractorInput {
    func loadTasks()
}

protocol ListInteractorOutput {
    func presentList(response: List.Tasks.Response)
}

class ListInteractor: ListInteractorInput
{
    var output: ListInteractorOutput!

    func loadTasks() {

        let response = List.Tasks.Response(tasks: DataManager.shared.tasks)
        output.presentList(response: response)
    }
}
