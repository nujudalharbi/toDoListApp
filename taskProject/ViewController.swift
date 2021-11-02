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
    var priority = 0
 
}


class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , AddTask {
    
  
    
 
    var tasks : [Task] = []
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    

    
    @IBAction func deleteButton(_ sender: Any) {
        tasks.removeAll()
        tableView.reloadData()
    }
    
    
   
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
      
        



        
       
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

        if tasks[indexPath.row].priority == 0 {
            cell.addTask.text = "Low" + "           " + tasks[indexPath.row].name
        }
        
        if tasks[indexPath.row].priority == 1 {
            cell.addTask.text = "Medium" + "          " +  tasks[indexPath.row].name
        }
        if tasks[indexPath.row].priority == 2 {
            cell.addTask.text = "High" +  "          " +  tasks[indexPath.row].name
        }

         
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
    func addTask(name : String, priority: Int) {
        
         tasks.append(Task(name :  name, priority: priority))
         tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
      
        }
        

        
        
        
        
        
       
        
    
    
    }
    
    
    
    

    
    
}
