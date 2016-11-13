//
//  CreateTaskPresenter.swift
//  CleanToDo
//

import UIKit

protocol CreateTaskPresenterInput {
    func taskSaved()
    func invalidTask()
    func updateDateButton(withDate date: Date)
}

protocol CreateTaskPresenterOutput: class {
    func diplayAlert(withViewModel viewModel: CreateTask.ViewModel)
    func updatePickDateButton(withTitle title: String)
    func dismiss()
}

class CreateTaskPresenter: CreateTaskPresenterInput {
    
    weak var output: CreateTaskPresenterOutput!

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()

    func taskSaved() {
        output.dismiss()
    }

    func invalidTask() {
        let viewModel = CreateTask.ViewModel(messageTitle: "Opsss...", message: "Something is wrong with your task :(")
        output.diplayAlert(withViewModel: viewModel)
    }

    func updateDateButton(withDate date: Date) {
        let title = "Picked date: " + dateFormatter.string(from: date)
        output.updatePickDateButton(withTitle: title)
    }
}
