//
//  addViewController.swift
//  taskProject
//
//  Created by نجود  on 26/03/1443 AH.
//

import UIKit

protocol AddTask {
    func addTask(name : String)
}

class addViewController: UIViewController {

    @IBOutlet weak var taskNameOutlet: UITextField!
    
 
    
    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != ""{
            
            delegate?.addTask(name : taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
            
//
//            if let text =  taskNameOutlet.text , !text.isEmpty{
//            let newEntry = [text]
//                UserDefaults.standard.setValue(newEntry , forKey: "items")}
        }
        
        
        
       
    }
    var delegate : AddTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        

       
    }
    

}
