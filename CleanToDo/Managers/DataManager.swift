//
//  DataManager.swift
//  CleanToDo
//

import Foundation

class DataManager {
    static let shared = DataManager()

    private(set) var tasks: [Task]

    init() {

        let initialTask = Task(title: "Learn CleanSwift", date: Date(timeIntervalSinceNow: 60*60*24))
        tasks = [initialTask]
    }

    func save(task: Task) {
        
        tasks.append(task)
    }
}
