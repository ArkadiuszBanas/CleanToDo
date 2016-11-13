//
//  CreateTaskConfigurator.swift
//  CleanToDo
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension CreateTaskViewController: CreateTaskPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension CreateTaskInteractor: CreateTaskViewControllerOutput {
}

extension CreateTaskPresenter: CreateTaskInteractorOutput {
}

class CreateTaskConfigurator {

    // MARK: - Object lifecycle

    static let sharedInstance = CreateTaskConfigurator()

    private init() {}

    // MARK: - Configuration

    func configure(viewController: CreateTaskViewController) {
        
        let router = CreateTaskRouter()
        router.viewController = viewController

        let presenter = CreateTaskPresenter()
        presenter.output = viewController

        let interactor = CreateTaskInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
