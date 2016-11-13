//
//  ListConfigurator.swift
//  CleanToDo
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension ListViewController: ListPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

extension ListInteractor: ListViewControllerOutput {
}

extension ListPresenter: ListInteractorOutput {
}

class ListConfigurator
{
    // MARK: - Object lifecycle

    static let sharedInstance = ListConfigurator()

    private init() {}

    // MARK: - Configuration

    func configure(viewController: ListViewController) {

        let router = ListRouter()
        router.viewController = viewController

        let presenter = ListPresenter()
        presenter.output = viewController

        let interactor = ListInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
