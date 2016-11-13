//
//  CreateTaskRouter.swift
//  CleanToDo
//

import UIKit

protocol CreateTaskRouterInput {
  func backToList()
}

class CreateTaskRouter: CreateTaskRouterInput
{
    weak var viewController: CreateTaskViewController!
  
    func backToList() {
        viewController.dismiss(animated: true, completion: nil)
    }

    func showAlert(withTitle title: String, message:String) {

        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alertView, animated: true, completion: nil)
    }

    // MARK: - Communication
    func passDataToNextScene(segue: UIStoryboardSegue) {
    }
}
