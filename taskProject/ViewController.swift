//
//  ViewController.swift
//  taskProject
//
//  Created by نجود  on 25/03/1443 AH.
//

import UIKit
struct Task{
    var name = ""
    var checked = false
    
    
    
}

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , AddTask{
   
    
   
    var tasks : [Task] = [Task(name: "One", checked: true)]

    @IBOutlet weak var tableView: UITableView!
    
    

    
   
    
    override func viewDidLoad() {
        
        tasks.append(Task(name : "Test object "))
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        self.tasks = UserDefaults.standard.stringArray(forKey: "items") ?? []
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tasks[indexPath.row].checked) {
            tasks[indexPath.row].checked = false
        } else {
            tasks[indexPath.row].checked = true
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! task
        
//        if cell.ischeck == false {
//            cell.checkTask.image = UIImage(named: "true1")
//            cell.ischeck = true
//        }else {
//            cell.checkTask.image = nil
//            cell.ischeck = false
//
//        }
   
        
        
        cell.addTask.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked {
            cell.checkTask.image = UIImage(named: "true11")
        } else {
            cell.checkTask.image = nil
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! addViewController
        VC.delegate = self
       
    }
    func addTask(name: String) {
       
        tasks.append(Task(name :  name))
        tableView.reloadData()
        }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
      
        }
 
        
        func update(){}
        
        func removeAll(){}
        
        
        
//
//        func  viewDidAppear(_animated : Bool){
//            let itemObject = UserDefaults.standard.object(forKey: "items")
//            if let tempItem = itemObject as? [String]{
//
//                tasks = tempItem
//
//            }
//            tableView.reloadData()
//        }
        
        


    
    
    }
    
    
    
    
    
    
    
}

