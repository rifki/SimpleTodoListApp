//
//  TaskManager.swift
//  TodoList
//
//  Created by rifki on 8/20/14.
//  Copyright (c) 2014 rifkilabs. All rights reserved.
//

import UIKit

var taskManager: TaskManager = TaskManager()

struct task {
    var name = ""
    var descDetail = ""
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    // Add Task
    func addTask(name: String, descDetail: String) {
        tasks.append(task(name: name, descDetail: descDetail))
    }
}
