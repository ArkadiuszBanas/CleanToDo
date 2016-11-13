//
//  ListModels.swift
//  CleanToDo
//

import UIKit

struct List {

    struct Tasks {

        struct Response {
            let tasks: [Task]
        }

        struct ViewModel {

            struct CellTask {
                let title: String
                let dueDate: String?
            }

            let tasks: [CellTask]
        }
    }
}
