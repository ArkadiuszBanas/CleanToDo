//
//  CreateTaskModels.swift
//  CleanToDo
//

import UIKit

struct CreateTask {

    struct Request {
        let title: String?
    }

    struct ViewModel {
        let messageTitle: String
        let message: String
    }
}
