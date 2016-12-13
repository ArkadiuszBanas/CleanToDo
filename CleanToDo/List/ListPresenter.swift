//
//  ListPresenter.swift
//  CleanToDo
//

import UIKit

protocol ListPresenterInput {
    func presentList(tasks: [Task])
}

protocol ListPresenterOutput: class {
    func reloadList(withViewModel viewModel: List.Tasks.ViewModel)
}

class ListPresenter: ListPresenterInput {

    weak var output: ListPresenterOutput!

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()

    func presentList(tasks: [Task]) {

        let cellTasks = tasks.flatMap { model -> List.Tasks.ViewModel.CellTask in

            var dueDate: String?
            if let date = model.date {
                dueDate = "Due date: " + dateFormatter.string(from: date)
            }
            return List.Tasks.ViewModel.CellTask(title: model.title, dueDate: dueDate)
        }
        
        let viewModel = List.Tasks.ViewModel(tasks: cellTasks)
        output.reloadList(withViewModel: viewModel)
    }
}
