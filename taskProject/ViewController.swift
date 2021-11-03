//
//  ViewController.swift
//  taskProject
//
//  Created by نجود  on 25/03/1443 AH.
//

import UIKit



class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , AddTask, EditTask {
    
  
    var tasks : [Task] = []

    @IBOutlet weak var tableView: UITableView!
    
    

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tasks.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    
    
    @IBAction func editButton(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
      
        
//-------
        

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tasks[indexPath.row].checked) {
            tasks[indexPath.row].checked = false
        } else {
            tasks[indexPath.row].checked = true
        }
        
        let editVC = storyboard?.instantiateViewController(withIdentifier: "edit") as! editTask
        editVC.delegate = self
        editVC.ourTask = tasks[indexPath.row].name
        
        navigationController?.show(editVC, sender: nil)
        
        curIndex = indexPath.row
        tableView.reloadData()
    }
     
    
    
    //----------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! task

        if tasks[indexPath.row].priority == 0 {
            cell.addTask.text = "🔵Low : " + tasks[indexPath.row].name
//            cell.addTask.textColor = .blue
        }
        
        if tasks[indexPath.row].priority == 1 {
            cell.addTask.text = "🟢 Medium : "  +  tasks[indexPath.row].name
//            cell.addTask.textColor = .green
        }
        if tasks[indexPath.row].priority == 2 {
            cell.addTask.text = " 🔴 High : " +  tasks[indexPath.row].name
//            cell.addTask.textColor = .red
            
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
    
    
    
    
    
//     add new task
    func addTask(name : String, priority: Int) {
        
         tasks.append(Task(name :  name, priority: priority))
         tableView.reloadData()
    }
    
    
    
    
    
 // editing task
    
    var curIndex = 0
    
    func editTask(name: String) {
        tasks[curIndex].name = name
        tableView.reloadData()
    }
    
    
    
    
//   delete task

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{

            tasks.remove(at: indexPath.row)
            tableView.reloadData()

        }

    }
    

}
    
    

