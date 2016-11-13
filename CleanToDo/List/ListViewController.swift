//
//  ListViewController.swift
//  CleanToDo
//

import UIKit

protocol ListViewControllerInput {
    func reloadList(withViewModel viewModel: List.Tasks.ViewModel)
}

protocol ListViewControllerOutput {
    func loadTasks()
}

class ListViewController: UIViewController {
    
    var output: ListViewControllerOutput!
    var router: ListRouter!

    var viewModel: List.Tasks.ViewModel?

    @IBOutlet var tableView: UITableView!
  
    override func awakeFromNib() {
        super.awakeFromNib()

        ListConfigurator.sharedInstance.configure(viewController: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.output.loadTasks()
    }

    @IBAction func addTaskButtonTapped(_ sender: AnyObject) {
        router.navigateToTaskCreation()
    }
}

extension ListViewController: ListViewControllerInput {

    func reloadList(withViewModel viewModel: List.Tasks.ViewModel) {

        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.tasks.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)

        if let task = self.viewModel?.tasks[indexPath.row],
            let listCell = cell as? ListCell {

            listCell.configure(withTask: task)
        }

        return cell
    }
}
