//
//  addViewController.swift
//  taskProject
//
//  Created by نجود  on 26/03/1443 AH.
//

import UIKit

protocol AddTask {
    func addTask(name : String, priority: Int)
}

class addViewController: UIViewController  {

    
    @IBOutlet weak var importance: UISegmentedControl!
    
    
    @IBOutlet weak var segmentText: UITextField!
    
    @IBOutlet weak var taskNameOutlet: UITextField!
   

    @IBAction func chanheSegment(_ sender: Any) {
//
//        if importance.selectedSegmentIndex == 0{
//            //taskNameOutlet.text = "low"
//
//
//        }
//        if importance.selectedSegmentIndex == 1{
//            //taskNameOutlet.text = "Medium"
//        }
//
//        if importance.selectedSegmentIndex == 2{
//
//            //taskNameOutlet.text = "High"
//
//        }
    }
    
    
    
 
    
    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != ""{
            
            delegate?.addTask(name : taskNameOutlet.text!, priority: importance.selectedSegmentIndex)
            navigationController?.popViewController(animated: true)
            
        }
        
        
        
       
    }
    var delegate : AddTask?
    override func viewDidLoad() {
        super.viewDidLoad()
  
            
        }
        
        
    }
    

    
    
    
    
    
//    func textFieldShouldReturn(_ textField : UITextField)-> Bool{
//        
//        saveTask()
//        return true
//        
//    }
//       
//    
//    @objc func saveTask(){
//        guard let text = taskNameOutlet.text, !text.isEmpty else {
//            
//            return
//        }
//        guard let count = UserDefaults().value(forKey: "count") as? Int else {
//            return
//            
//        }
//        let newCount = count + 1
//        UserDefaults().set(newCount , forKey: "count")
//        UserDefaults().set(text , forKey: "task \(newCount)")
//        
//    }

    
    
    
    
    
   

