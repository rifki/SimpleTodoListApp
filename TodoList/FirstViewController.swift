//
//  FirstViewController.swift
//  TodoList
//
//  Created by rifki on 8/20/14.
//  Copyright (c) 2014 rifkilabs. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tblTask: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tblTask.reloadData()
    }
    
    // delegate editing style
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            if taskManager.tasks.isEmpty {
                let alert = UIAlertView()
                alert.title = "Error"
                alert.message = "Task is empty"
                alert.addButtonWithTitle("OK")
                alert.show()
            } else {
                taskManager.tasks.removeAtIndex(indexPath.row)
                tableView.reloadData()
                println("delete for \(indexPath.row)")
            }
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if taskManager.tasks.isEmpty {
            return 1
        } else {
            return taskManager.tasks.count
        }
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCell")
        
        if taskManager.tasks.isEmpty {
            //cell.textLabel.text = "No Task"
        } else {
            cell.textLabel.text = taskManager.tasks[indexPath.row].name
            cell.detailTextLabel.text = taskManager.tasks[indexPath.row].descDetail
        }

        return cell
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
}

