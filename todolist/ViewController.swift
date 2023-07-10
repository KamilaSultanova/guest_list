//
//  ViewController.swift
//  todolist
//
//  Created by Kamila Sultanova on 05.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textSurnameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Guest"
        // Do any additional setup after loading the view.
    }
    @IBAction func addTask(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let taskName = textField.text!
        let taskSurname = textSurnameField.text!
        
        
        var newTask = TaskItem()
        newTask.name = taskName
        newTask.surname = taskSurname
        
//        var taskarray:[TaskItem] = []
        
        do{
            if let data = defaults.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodeddata = try JSONEncoder().encode(array)
                
                defaults.set(encodeddata, forKey: "taskItemArray")
            }else{
                let encodeddata = try JSONEncoder().encode([newTask])
                
                defaults.set(encodeddata, forKey: "taskItemArray")
            }
            
        }catch{
            print("unable to encode \(error)")
        }
        
//        if let array = defaults.array(forKey: "taskItemArray"){
//            taskarray = array as! [TaskItem]
//            taskarray.append(newTask)
//
//            defaults.set(taskarray, forKey: "taskItemArray")
//        }else{
//            let array = [newTask]
//
//            defaults.set(taskarray, forKey: "taskItemArray")
//        }
        
//        var taskArray: [String] = []
//
//        if let array = defaults.array(forKey: "taskArray"){
//
//            taskArray = array as! [String]
//
//            taskArray.append(taskName)
//
//            defaults.set(taskArray, forKey: "taskArray")
//        }else{
//            let array = [taskName]
//            defaults.set(array,forKey: "taskArray")
//        }
        
        textField.text = ""
        textSurnameField.text = ""
    
            }
    
}

