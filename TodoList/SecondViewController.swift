//
//  SecondViewController.swift
//  TodoList
//
//  Created by rifki on 8/20/14.
//  Copyright (c) 2014 rifkilabs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskDescDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // task action
    @IBAction func taskAction(sender: AnyObject) {
        let alert = UIAlertView()
        alert.title = "Error"
        alert.addButtonWithTitle("OK")
        
        if taskName.text.isEmpty {
            alert.message = "Task name canot be blank"
            alert.show()
        } else if taskDescDetail.text.isEmpty {
            alert.message = "Task description canot be blank"
            alert.show()
        } else {
            taskManager.addTask(taskName.text, descDetail: taskDescDetail.text)
            self.view.endEditing(true)
            taskName.text = ""
            taskDescDetail.text = ""
            self.tabBarController.selectedIndex = 0
        }
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    // Delegate. called when 'return' key
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

