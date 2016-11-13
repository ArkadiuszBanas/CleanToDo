//
//  CreateTaskViewController.swift
//  CleanToDo
//

import UIKit

private struct CreateTaskConstant {
    static let animationDuration = 0.3
}

protocol CreateTaskViewControllerInput {
    func diplayAlert(withViewModel viewModel: CreateTask.ViewModel)
    func updatePickDateButton(withTitle title: String)
    func dismiss()
}

protocol CreateTaskViewControllerOutput {
    func createTask(withRequest request: CreateTask.Request)
    func pick(dueDate: Date)
}

class CreateTaskViewController: UIViewController
{
    var output: CreateTaskViewControllerOutput!
    var router: CreateTaskRouter!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickDateButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func awakeFromNib() {
        super.awakeFromNib()

        CreateTaskConfigurator.sharedInstance.configure(viewController: self)
    }

    @IBAction func doneButttonTapped(_ sender: AnyObject) {
        let request = CreateTask.Request(title: textField.text)
        output.createTask(withRequest: request)
    }

    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        textField.resignFirstResponder()
        router.backToList()
    }

    @IBAction func pickDateButtonTapped(_ sender: AnyObject) {

        textField.resignFirstResponder()

        output.pick(dueDate: datePicker.date)

        UIView.animate(withDuration: CreateTaskConstant.animationDuration) {
            let newAlpha: CGFloat = self.datePicker.alpha == 1 ? 0 : 1
            self.datePicker.alpha = newAlpha
        }
    }

    @IBAction func datePickerValueChanged(_ sender: AnyObject) {
        output.pick(dueDate: datePicker.date)
    }
}

extension CreateTaskViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {

        UIView.animate(withDuration: CreateTaskConstant.animationDuration) { 
            self.datePicker.alpha = 0
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }
}

extension CreateTaskViewController: CreateTaskViewControllerInput {

    func diplayAlert(withViewModel viewModel: CreateTask.ViewModel) {
        router.showAlert(withTitle: viewModel.messageTitle, message: viewModel.message)
    }

    func updatePickDateButton(withTitle title: String) {
        pickDateButton.setTitle(title, for: .normal)
    }

    func dismiss() {
        textField.resignFirstResponder()
        router.backToList()
    }
}
