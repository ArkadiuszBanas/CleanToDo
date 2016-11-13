//
//  ListRouter.swift
//  CleanToDo
//

import UIKit

protocol ListRouterInput {
    func navigateToTaskCreation()
}

class ListRouter: ListRouterInput
{
    weak var viewController: ListViewController!
  
    func navigateToTaskCreation() {

        self.viewController.performSegue(withIdentifier: "showCreateTaskControllerSegue", sender: nil)
    }

    func passDataToNextScene(_ segue: UIStoryboardSegue) {

    }
}
